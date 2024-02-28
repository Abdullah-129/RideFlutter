import { NgModule } from '@angular/core';
import { APOLLO_OPTIONS } from 'apollo-angular';
import {
  ApolloCache,
  ApolloClientOptions,
  ApolloLink,
  InMemoryCache,
  NormalizedCacheObject,
  split,
} from '@apollo/client/core';
import { HttpLink } from 'apollo-angular/http';
import { DefaultOptions } from '@apollo/client/core';
import { setContext } from '@apollo/client/link/context';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { getMainDefinition } from '@apollo/client/utilities';
import { WebSocketLink } from '@apollo/client/link/ws';

export function createApollo(httpLink: HttpLink): ApolloClientOptions<NormalizedCacheObject> {
  const http = httpLink.create({
    uri: `${environment.root}graphql`,
  });
  const wsLink = new WebSocketLink({
    uri: environment.wsEndpoint,
    options: {
      reconnect: true,
      connectionParams: {
        authToken: localStorage.getItem('ridy_admin_token')
      }
    },
  });
  const basic = setContext(() => ({
    headers: {
      Accept: 'charset=utf-8',
    },
  }));
  const auth = setContext(() => {
    return {
      headers: {
        Authorization: `Bearer ${localStorage.getItem('ridy_admin_token')}`,
      },
    };
  });
  const defaultOptions: DefaultOptions = {
    watchQuery: {
      fetchPolicy: 'no-cache',
      //errorPolicy: 'ignore',
    },
    query: {
      fetchPolicy: 'no-cache',
      //errorPolicy: 'all',
    },
  };
  const link = ApolloLink.from([basic, auth, http]);
  const splitLink = split(
    ({ query }) => {
      const definition = getMainDefinition(query);
      return (
        definition.kind === 'OperationDefinition' &&
        definition.operation === 'subscription'
      );
    },
    wsLink,
    link
  );
  
  return {
    cache: new InMemoryCache({
      addTypename: false,
    }),
    link: splitLink,
    defaultOptions,
  };
}

@NgModule({
  providers: [
    {
      provide: APOLLO_OPTIONS,
      useFactory: createApollo,
      deps: [HttpLink],
    },
  ],
})
export class GraphQLModule {}

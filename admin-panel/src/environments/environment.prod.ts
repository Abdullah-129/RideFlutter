export const environment = {
  production: true,
  root: `${window.location.protocol}//${window.location.hostname.toString()}:4001/`,
  wsEndpoint: `${window.location.protocol.replace('http','ws')}//${window.location.hostname.toString()}:4001/graphql`
};

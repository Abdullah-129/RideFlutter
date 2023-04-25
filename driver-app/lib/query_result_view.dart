import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class QueryResultView extends StatelessWidget {
  final QueryResult queryResult;

  const QueryResultView(this.queryResult, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (queryResult.isLoading) {
      return const QueryResultLoadingView();
    }
    if (queryResult.hasException) {
      return Center(
        child: Text(queryResult.exception.toString()),
      );
    }
    return Container();
  }
}

class QueryResultLoadingView extends StatelessWidget {
  const QueryResultLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator.adaptive(),
        const SizedBox(height: 8),
        Text(
          S.of(context).loading,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class QueryResultView extends StatelessWidget {
  final QueryResult queryResult;

  const QueryResultView(this.queryResult, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (queryResult.isLoading) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CupertinoActivityIndicator(),
          const SizedBox(height: 8),
          Text(
            S.of(context).loading,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ));
    }
    if (queryResult.hasException) {
      if (queryResult.exception
          .toString()
          .contains("Connection closed before full header was received")) {
        return Column(
          children: const [Text("Network error, Please try again later.")],
        );
      }
      return Center(
        child: Text(queryResult.exception.toString()),
      );
    }
    return const SizedBox();
  }
}

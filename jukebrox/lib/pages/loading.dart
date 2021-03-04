import 'package:flutter/material.dart';

import 'error.dart';

class LoadingScreen extends StatelessWidget {
  Future future;
  final Widget Function(dynamic) callback;

  LoadingScreen({this.future, this.callback});

  Widget buildFutureBuilder() {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return callback(snapshot.data);
        } else if (snapshot.hasError) {
          return ErrorScreen(snapshot.error);
        }
        return buildLoading();
      },
    );
  }

  Widget buildLoading() {
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildFutureBuilder(),
      ),
    );
  }
}

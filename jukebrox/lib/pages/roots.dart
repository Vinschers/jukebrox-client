import 'package:flutter/material.dart';
import 'package:jukebrox/backend/states/start_state.dart';
import 'package:jukebrox/models/root_folder.dart';

class RootsScreen extends StatelessWidget {
  List<RootFolder> rootFolders;

  RootsScreen(rootFolders);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("oiiiii"),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:jukebrox/widgets/root_container.dart';

import 'package:jukebrox/models/root_folder.dart';

class RootsScreen extends StatelessWidget {
  List<RootFolder> rootFolders;

  RootsScreen(this.rootFolders);

  @override
  Widget build(BuildContext context) {
    List<RootContainer> roots = rootFolders.map((root) => RootContainer(root.name)).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Root Folders'),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: ListView(
        children: roots,
      ),
    );
  }
}
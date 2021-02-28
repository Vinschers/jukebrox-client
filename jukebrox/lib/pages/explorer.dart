import 'package:flutter/material.dart';
import 'package:jukebrox/models/folder.dart';

class ExplorerScreen extends StatelessWidget {
  final Folder folder;

  ExplorerScreen({this.folder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(this.folder.name),
      ),
    );
  }
}
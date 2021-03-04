import 'package:flutter/material.dart';

import 'package:jukebrox/models/folder.dart';

import 'package:jukebrox/pages/explorer.dart';
import 'package:jukebrox/widgets/list_container.dart';


class FolderContainer extends ListContainer {
  Folder folder;

  FolderContainer(this.folder) : super(backgroundColor: Colors.red[50], padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      icon: Icon(Icons.folder), text: folder.name, color: Colors.black);

  @override
  TextStyle getTextStyle(context) {
    return Theme.of(context).textTheme.headline5;
  }

  @override
  void onClick(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ExplorerScreen(folder: folder)));
  }

}
import 'package:flutter/material.dart';
import 'package:jukebrox/models/folder.dart';
import 'package:jukebrox/widgets/folder_container.dart';
import 'package:jukebrox/widgets/list_container.dart';
import 'package:jukebrox/widgets/music_container.dart';

class ExplorerScreen extends StatelessWidget {
  final Folder folder;

  ExplorerScreen({this.folder});

  List<ListContainer> getChildren() {
    List<FolderContainer> folderContainers = this.folder.subFolders.map((f) => FolderContainer(f)).toList();
    List<MusicContainer> musicContainers = this.folder.musics.map((m) => MusicContainer(m)).toList();

    List<ListContainer> children = List();
    children.addAll(folderContainers);
    children.addAll(musicContainers);

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: getChildren(),
        ),
      ),
    );
  }
}
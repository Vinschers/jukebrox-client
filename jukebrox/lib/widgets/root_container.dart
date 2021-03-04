import 'package:flutter/material.dart';

import 'package:jukebrox/backend/utils/tree_organizer.dart';
import 'package:jukebrox/backend/utils/requester.dart';
import 'package:jukebrox/backend/utils/filter.dart';
import 'package:jukebrox/models/folder.dart';

import 'package:jukebrox/models/root_folder.dart';
import 'package:jukebrox/models/drive_file.dart';
import 'package:jukebrox/pages/explorer.dart';
import 'package:jukebrox/pages/loading.dart';
import 'package:jukebrox/widgets/list_container.dart';

class RootContainer extends ListContainer {
  final RootFolder rootFolder;

  RootContainer(this.rootFolder) : super(backgroundColor: Colors.red[50], padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      icon: Image(image: AssetImage('assets/images/google_drive_icon.png'), width: 40), text: rootFolder.name, color: Colors.black);

  Future<Folder> fetchFilesFromDrive() async {
    var stopwatch = Stopwatch()..start();
    List<DriveFile> files = await buildDriveTree(this.rootFolder.id);
    print('Files retrived in ${stopwatch.elapsed}');
    stopwatch = Stopwatch()..start();
    Folder root = organizeTree(filterMusicsFromDrive(files), this.rootFolder.id);
    print('Folder tree built in ${stopwatch.elapsed}');
    stopwatch.stop();
    return root;
  }

  @override
  void onClick(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoadingScreen(
              future: fetchFilesFromDrive(),
              callback: (dynamic) => ExplorerScreen(folder: dynamic as Folder)
            )
        ),
    );
  }

  @override
  TextStyle getTextStyle(context) {
    return Theme.of(context).textTheme.headline5;
  }
}

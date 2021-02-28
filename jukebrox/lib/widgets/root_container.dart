import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:jukebrox/backend/utils/tree_organizer.dart';
import 'package:jukebrox/backend/utils/requester.dart';
import 'package:jukebrox/backend/utils/filter.dart';
import 'package:jukebrox/models/folder.dart';

import 'package:jukebrox/models/root_folder.dart';
import 'package:jukebrox/models/drive_file.dart';
import 'package:jukebrox/pages/explorer.dart';

class RootContainer extends StatelessWidget {
  final RootFolder rootFolder;

  RootContainer(this.rootFolder);

  Future onClick(context) async {
    List<DriveFile> files = await buildDriveTree(this.rootFolder.id);
    
    Folder root = organizeTree(filterMusicsFromDrive(files), this.rootFolder.id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ExplorerScreen(folder: root)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.headline5.fontSize * 1.1 + 50.0,
            ),
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Image(
                  image: AssetImage('assets/images/google_drive_icon.png'),
                  width: 40,
                ),
                Text(this.rootFolder.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.black)),
              ],
            ),
          ),
          onTap: () {
            onClick(context);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jukebrox/models/music.dart';

import 'package:jukebrox/pages/loading.dart';
import 'package:jukebrox/widgets/list_container.dart';


class MusicContainer extends ListContainer{
  Music music;

  MusicContainer(this.music) : super(backgroundColor: Colors.red[50], padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      icon: Icon(Icons.music_video), text: music.name, color: Colors.black);

  @override
  TextStyle getTextStyle(context) {
    return Theme.of(context).textTheme.headline5;
  }

  @override
  void onClick(context) {
    return;
  }
}
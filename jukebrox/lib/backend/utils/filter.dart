import 'package:jukebrox/models/music.dart';
import 'package:jukebrox/models/drive_file.dart';

List<Music> filterMusicsFromDrive(List<DriveFile> files) {
  List<Music> musics = List();
  for(var i = 0; i < files.length; ++i) {
    if (files[i].mimeType == 'audio/mpeg')
      musics.add(Music.fromDriveFile(files[i]));
  }

  return musics;
}
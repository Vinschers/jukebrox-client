import 'package:jukebrox/models/music.dart';
import 'package:jukebrox/models/drive_file.dart';

List<Music> filterMusicsFromDrive(List<DriveFile> files) {
  List<Music> musics = List();
  for(var i = 0; i < files.length; ++i) {
    if (Music.isMusic(files[i].mimeType))
      musics.add(Music.fromDriveFile(files[i]));
  }

  return musics;
}
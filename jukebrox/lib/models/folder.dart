import 'music.dart';

class Folder {
  final String name;
  final List<Folder> subFolders;
  final List<Music> musics;

  Folder({this.name, this.subFolders, this.musics});
}
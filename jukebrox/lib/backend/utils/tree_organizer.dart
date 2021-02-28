import 'package:jukebrox/models/folder.dart';
import 'package:jukebrox/models/music.dart';
import 'package:jukebrox/models/drive_file.dart';

Folder organizeTree(List<Music> musics, String rootId) {
  Map<String, Folder> hashFolders = new Map();

  for(var i = 0; i < musics.length; ++i) {
    Music currentMusic = musics[i];
    Folder lastFolder = null;

    for(var j = currentMusic.path.length - 1; j >= 0; --j) {
      Map<String, dynamic> currentPath = currentMusic.path[j];
      Folder currentFolder = hashFolders[currentPath['id']];

      if (currentFolder == null) {
        currentFolder = Folder(name: currentPath['name'], subFolders: [], musics: []);
        hashFolders[currentPath['id']] = currentFolder;
      }

      if (lastFolder == null) {
        currentFolder.musics.add(currentMusic);
      } else if(!currentFolder.subFolders.contains(lastFolder)) {
        currentFolder.subFolders.add(lastFolder);
      }

      lastFolder = currentFolder;
    }
  }

  return hashFolders[rootId];
}
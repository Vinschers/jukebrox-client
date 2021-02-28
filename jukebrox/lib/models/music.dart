import 'package:jukebrox/models/drive_file.dart';

class Music extends DriveFile {
  String foo;

  Music({id, name, mimeType, createdAt, iconLink, size, contentLink, path, this.foo}) :
        super(id: id, name: name, mimeType: mimeType, createdAt: createdAt, iconLink: iconLink, size: size, contentLink: contentLink, path: path);

  factory Music.fromDriveFile(DriveFile file) {
    return Music(
      id: file.id,
      name: file.name,
      createdAt: file.createdAt,
      iconLink: file.iconLink,
      size: file.size,
      contentLink: file.contentLink,
      path: file.path,
      foo: '',
    );
  }
}
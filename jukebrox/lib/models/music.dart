import 'package:jukebrox/models/drive_file.dart';

class Music extends DriveFile {
  static List<String> MIME_TYPES = ['audio/basic', 'auido/L24', 'audio/mid', 'audio/mpeg', 'audio/mp4', 'audio/x-aiff',
                                    'audio/x-mpegurl', 'audio/vnd.rn-realaudio', 'audio/ogg', 'audio/vorbis', 'audio/vnd.wav'];

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

  static bool isMusic(String mimeType) {
    return MIME_TYPES.contains(mimeType);
  }
}
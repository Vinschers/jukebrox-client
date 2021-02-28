class DriveFile {
  final String id;
  final String name;
  final DateTime createdAt;
  final String mimeType;
  final String iconLink;
  final int size;
  final String contentLink;

  List<dynamic> path;

  DriveFile({this.id, this.name, this.mimeType, this.createdAt, this.iconLink, this.size, this.contentLink, this.path});

  factory DriveFile.fromJson(Map<String, dynamic> json) {
    return DriveFile(
      id: json['id'],
      name: json['name'],
      mimeType: json['mimeType'],
      createdAt: DateTime.parse(json['createdTime']),
      iconLink: json['iconLink'],
      size: int.parse(json['size']),
      contentLink: json['webContentLink'],
      path: json['drivePath']
    );
  }
}
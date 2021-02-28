import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jukebrox/models/drive_file.dart';
import 'package:jukebrox/models/root_folder.dart';

final String baseUrl = 'http://192.168.0.12:5643';

Future<List<RootFolder>> fetchRootFolders() async {
  await Future.delayed(Duration(seconds: 3));
  List<RootFolder> list = [RootFolder(id: '1V5x0HWY7CONTXVDpYOZjBxLQfZIOLpWl', name: 'music'),
                           RootFolder(id: '1llaLHyc5YU0sjUY-4vebmc5-ymTrj7oj', name: 'weeb shit')];
  return list;
}

Future<List<DriveFile>> buildDriveTree(String fileId) async {
  final response = await http.get(baseUrl+'/api/$fileId/buildTree');

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body)['result'] as List;
    List<DriveFile> fileList = result.map((json) => DriveFile.fromJson(json)).toList();

    return fileList;
  } else {
    throw Exception('Failed to get file $fileId');
  }
}
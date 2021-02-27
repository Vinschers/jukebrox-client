import 'package:flutter/material.dart';
import 'package:jukebrox/pages/start.dart';
import 'package:jukebrox/backend/utils/requester.dart';
import 'package:jukebrox/models/root_folder.dart';
import 'package:jukebrox/pages/roots.dart';

class StartScreenState extends State<StartScreen> {
  Future<List<RootFolder>> futureRootFolders;

  @override
  void initState() {
    super.initState();
    futureRootFolders = fetchRootFolders();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'get example',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: futureRootFolders,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return RootsScreen(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
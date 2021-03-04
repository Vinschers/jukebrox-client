import 'package:flutter/material.dart';

import 'package:jukebrox/pages/start.dart';
import 'package:jukebrox/pages/loading.dart';
import 'package:jukebrox/pages/roots.dart';

import 'package:jukebrox/backend/utils/requester.dart';

import 'package:jukebrox/models/root_folder.dart';


class StartScreenState extends State<StartScreen> {
  Future<List<RootFolder>> futureRootFolders;

  @override
  void initState() {
    super.initState();
    futureRootFolders = fetchRootFolders();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      future: futureRootFolders,
      callback: (dynamic) => RootsScreen(dynamic as List<RootFolder>),
    );
  }
}
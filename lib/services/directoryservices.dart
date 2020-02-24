import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class DirServices {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // For your reference print the AppDoc directory
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await this._localPath;
    String pathName = p.join(path, "testimage.png");
    return File(pathName);
  }

  Future<File> writeContent() async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('Hello Folks');
  }

  Future<String> readcontent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      print("data insdie data file is  $contents");
      return contents;
    } catch (e) {
      // If there is an error reading, return a default String
      return 'Error';
    }
  }

    Future<File> file(String filename,) async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory dir = await getApplicationDocumentsDirectory();
    String pathName = p.join(dir.path, filename);
    return File(pathName);

  }
}

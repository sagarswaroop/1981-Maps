import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class DirServices {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _kyePlanfile async {
    final path = await this._localPath;
    String pathName = p.join(path, "keyMapdata.txt");
    return File(pathName);
  }

  Future<File> saveKeyPlans(dynamic keyplans) async {
    File file = await _kyePlanfile;
    file.writeAsStringSync(json.encode(keyplans));
    return file;
  }

  Future loadKeyPlans(getData(List data)) async {
    File file = await _kyePlanfile;
    dynamic keyplans = await file.readAsString();
    List plan = json.decode(keyplans);
    getData(plan);
  }

}

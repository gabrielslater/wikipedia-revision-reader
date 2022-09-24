import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

/// Reads a JSON file from test files.
/// [filename] does not include extension
Future<Map<String, dynamic>> readJson(String filename) async {
  // written with assistance of
  // https://docs.flutter.dev/cookbook/persistence/reading-writing-files
  final file = File(p.join('test', 'data', '$filename.json'));
  final contents = await file.readAsString();

  return jsonDecode(contents);
}

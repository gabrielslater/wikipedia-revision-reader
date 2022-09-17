import 'dart:io';

import 'package:path/path.dart' as p;

void main() async {}

/// Reads a JSON file from test files.
/// [filename] does not include extension
Future<String> readJson(String filename) async {
  // written with assistance of
  // https://docs.flutter.dev/cookbook/persistence/reading-writing-files#4-read-data-from-the-file
  final file = File(p.join('test', 'data', '$filename.json'));
  final contents = await file.readAsString();

  return contents;
}

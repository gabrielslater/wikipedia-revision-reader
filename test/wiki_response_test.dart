import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/wiki_response.dart';

void main() async {
  final queries = ['c._elegans', 'pet_door', 'jack_brierley'];
  var responses = {};

  for (String query in queries) {
    var json = jsonDecode(await readJson(query));
    responses[query] = WikiResponse.fromJson(json);
  }

  test('WikiResponse created', () {
    for (String response in responses.keys) {
      expect(responses[response].runtimeType, WikiResponse);
    }
  });

  test('WikiResponse properly unpacks JSON data', () {
    var expectedTitles = [
      'Caenorhabditis elegans',
      'Pet door',
      'Jack Brierley'
    ];
    var expectedRevisions = [30, 30, 12];

    var responseIndex = 0;

    for (String response in responses.keys) {
      expect(responses[response].title, expectedTitles[responseIndex]);
      expect(responses[response].revisions.length,
          expectedRevisions[responseIndex]);

      responseIndex++;
    }
  });

  test('WikiResponse stores any redirect', () {
    var expectedRedirects = [
      {
        'from': 'C. Elegans',
        'to': 'Caenorhabditis elegans',
      },
      {},
      {}
    ];

    var responseIndex = 0;

    for (String response in responses.keys) {
      expect(responses[response].redirect, expectedRedirects[responseIndex]);

      responseIndex++;
    }
  });
}

/// Reads a JSON file from test files.
/// [filename] does not include extension
Future<String> readJson(String filename) async {
  // written with assistance of
  // https://docs.flutter.dev/cookbook/persistence/reading-writing-files
  final file = File(p.join('test', 'data', '$filename.json'));
  final contents = await file.readAsString();

  return contents;
}

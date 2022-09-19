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
    var expected_titles = [
      'Caenorhabditis elegans',
      'Pet door',
      'Jack Brierley'
    ];
    var expected_revisions = [30, 30, 12];

    var response_index = 0;

    for (String response in responses.keys) {
      expect(responses[response].title, expected_titles[response_index]);
      expect(responses[response].revisions.length,
          expected_revisions[response_index]);

      response_index++;
    }
  });

  test('WikiResponse stores any redirect', () {
    var expected_redirects = [
      {
        'from': 'C. Elegans',
        'to': 'Caenorhabditis elegans',
      },
      {},
      {}
    ];

    var response_index = 0;

    for (String response in responses.keys) {
      expect(responses[response].redirect, expected_redirects[response_index]);

      response_index++;
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

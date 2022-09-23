import 'dart:convert';

import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/read_json.dart';
import 'package:twp_payton_h_gabriel_s/wiki_response.dart';

void main() async {
  final queries = ['c._elegans', 'pet_door', 'jack_brierley'];
  var responses = {};
  var responseJson = {};
  int responseIndex;

  for (String query in queries) {
    responseJson[query] = jsonDecode(await readJson(query));
  }

  group('WikiResponse', () {
    for (String query in queries) {
      responses[query] = WikiResponse.fromJson(responseJson[query]);
      test('WikiResponse created from "{$responseJson[query]}"', () {
        for (String response in responses.keys) {
          expect(responses[response].runtimeType, WikiResponse);
        }
      });
    }

    var expectedTitles = [
      'Caenorhabditis elegans',
      'Pet door',
      'Jack Brierley'
    ];
    var expectedRevisions = [30, 30, 12];

    test('WikiResponse properly unpacks JSON data', () {
      responseIndex = 0;

      for (String response in responses.keys) {
        expect(responses[response].title, expectedTitles[responseIndex]);
        expect(responses[response].revisions.length,
            expectedRevisions[responseIndex]);

        responseIndex++;
      }
    });

    var expectedRedirects = [
      {
        'from': 'C. Elegans',
        'to': 'Caenorhabditis elegans',
      },
      {},
      {}
    ];

    test('WikiResponse stores any redirect', () {
      responseIndex = 0;

      for (String response in responses.keys) {
        expect(responses[response].redirect, expectedRedirects[responseIndex]);

        responseIndex++;
      }
    });
  });
}

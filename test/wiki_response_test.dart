import 'dart:convert';

import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/read_json.dart';
import 'package:twp_payton_h_gabriel_s/wiki_response.dart';

void main() async {
  final queries = ['c._elegans', 'pet_door', 'jack_brierley'];
  var responses = {};
  int responseIndex;

  for (String query in queries) {
    var json = jsonDecode(await readJson(query));
    responses[query] = WikiResponse.fromJson(json);
  }

  group('WikiResponse', () {
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

      responseIndex = 0;

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

      responseIndex = 0;

      for (String response in responses.keys) {
        expect(responses[response].redirect, expectedRedirects[responseIndex]);

        responseIndex++;
      }
    });
  });
}

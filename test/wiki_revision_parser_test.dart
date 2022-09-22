import 'dart:convert';

import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/read_json.dart';
import 'package:twp_payton_h_gabriel_s/revision_parser.dart';

void main() async {
  final queries = ['c._elegans', 'pet_door', 'jack_brierley'];
  var revisions = {};

  final revisionParser = RevisionParser();

  for (String query in queries) {
    var json = jsonDecode(await readJson(query));
    revisions[query] = RevisionParser.parseRevisions(json);
  }

  group('revision_parser', () {
    test('RevisionParser created successfully', () {
      expect(revisionParser.runtimeType, RevisionParser);
    });
  });
}

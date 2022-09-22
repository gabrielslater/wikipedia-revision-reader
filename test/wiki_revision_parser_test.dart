import 'dart:convert';

import 'package:twp_payton_h_gabriel_s/read_json.dart';

void main() async {
  final queries = ['c._elegans', 'pet_door', 'jack_brierley'];
  var revisions = {};

  for (String query in queries) {
    var json = jsonDecode(await readJson(query));
    revisions[query] = RevisionParser.parseRevisions(json);
  }
}

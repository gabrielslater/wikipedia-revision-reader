import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/wiki_response.dart';

void main() async {
  final c_elegans_json = await readJson('c._elegans');
  final pet_door_json = await readJson('pet_door');
  final jack_brierley_json = await readJson('jack_brierley');
  final c_elegans_response = WikiResponse.fromJson(jsonDecode(c_elegans_json));
  final pet_door_response = WikiResponse.fromJson(jsonDecode(pet_door_json));
  final jack_brierley_response =
      WikiResponse.fromJson(jsonDecode(jack_brierley_json));

  test('WikiResponse created', () {
    expect(c_elegans_response.runtimeType, WikiResponse);
    expect(pet_door_response.runtimeType, WikiResponse);
    expect(jack_brierley_response.runtimeType, WikiResponse);
  });

  test('WikiResponse properly unpacks JSON data', () {
    expect(c_elegans_response.title, 'Caenorhabditis elegans');
    expect(c_elegans_response.revisions.length, 30);

    expect(pet_door_response.title, 'Pet door');
    expect(pet_door_response.revisions.length, 30);

    expect(jack_brierley_response.title, 'Jack Brierley');
    expect(jack_brierley_response.revisions.length, 12);
  });

  test('WikiResponse stores any redirect', () {
    expect(c_elegans_response.redirect, {
      'from': 'C. Elegans',
      'to': 'Caenorhabditis elegans',
    });
    expect(pet_door_response.redirect, {});
    expect(jack_brierley_response.redirect, {});
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

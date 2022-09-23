import 'dart:convert';

import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/wiki_revision.dart';

void main() async {
  // string of revisions to cut down on the test cases that need to be verified
  String revisionStrings = '{"revisions":['
      '{"user":"Josve05a","timestamp":"2022-09-16T18:44:51Z"},'
      '{"user":"JCW-CleanerBot","timestamp":"2022-09-04T00:05:04Z"},'
      '{"user":"Jonsta247","timestamp":"2022-08-30T09:49:23Z"},'
      '{"user":"Jonsta247","timestamp":"2022-08-30T09:44:38Z"},'
      '{"user":"Rlink2","timestamp":"2022-08-17T12:26:04Z"},'
      '{"user":"99.101.56.68","anon":true,"timestamp":"2022-06-09T18:19:31Z"},'
      '{"user":"99.101.56.68","anon":true,"timestamp":"2022-05-23T11:38:51Z"},'
      '{"user":"101.78.69.215","anon":true,"timestamp":"2022-03-12T02:07:41Z"},'
      '{"user":"Qwerfjkl (bot)","timestamp":"2022-02-05T12:08:05Z"}'
      ']}';

  var revisionJson = jsonDecode(revisionStrings)['revisions'];
  var revisions = [];

  // Outline of Revision class
  // Revision
  //     - String user
  //     - bool isAnon
  //     - DateTime timestamp

  group('Revision', () {
    for (var revision = 0; revision < revisionJson.length; revision++) {
      revisions.add(WikiRevision.fromJson(revisionJson[revision]));
      test('Revision created from "${revisionJson[revision]}"', () {
        expect(revisions[revision].runtimeType, WikiRevision);
      });
    }

    var expectedUsers = [
      'Josve05a',
      'JCW-CleanerBot',
      'Jonsta247',
      'Jonsta247',
      'Rlink2',
      '99.101.56.68',
      '99.101.56.68',
      '101.78.69.215',
      'Qwerfjkl (bot)'
    ];

    for (var expectedUser = 0;
        expectedUser < expectedUsers.length;
        expectedUser++) {
      var revision = revisions[expectedUser];
      test('Revision created by ${expectedUsers[expectedUser]}', () {
        expect(revision.user, expectedUsers[expectedUser]);
      });
    }

    var expectedAnons = [
      false,
      false,
      false,
      false,
      false,
      true,
      true,
      true,
      false
    ];

    for (var expectedAnon = 0;
        expectedAnon < expectedAnons.length;
        expectedAnon++) {
      var revision = revisions[expectedAnon];
      test(
          'Revision ${expectedAnons[expectedAnon] ? 'is' : 'is not'} anonymous',
          () {
        expect(revision.isAnon, expectedAnons[expectedAnon]);
      });
    }
  });
}

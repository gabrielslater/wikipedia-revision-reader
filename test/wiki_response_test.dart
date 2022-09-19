import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/wiki_response.dart';

void main() async {
  final c_elegans_json = await readJson('c._elegans');
  final c_elegans_response = WikiResponse.fromJson(jsonDecode(c_elegans_json));

  test('WikiResponse created', () {
    expect(c_elegans_response.runtimeType, WikiResponse);
    // for now, content was only to verify that we got a "response" at all --
    //   content is not a final property of a WikiResponse
    // expect(
    //     c_elegans_response.content ==
    //         '''
    //         "redirects": [
    //             {
    //                 "from": "C. Elegans",
    //                 "to": "Caenorhabditis elegans"
    //             }
    //         ],
    //         "pages": [
    //             {
    //                 "pageid": 57546,
    //                 "ns": 0,
    //                 "title": "Caenorhabditis elegans",
    //                 "revisions": [
    //                     {
    //                         "user": "Josve05a",
    //                         "timestamp": "2022-09-16T18:44:51Z"
    //                     },
    //                     {
    //                         "user": "JCW-CleanerBot",
    //                         "timestamp": "2022-09-04T00:05:04Z"
    //                     },
    //                     {
    //                         "user": "Jonsta247",
    //                         "timestamp": "2022-08-30T09:49:23Z"
    //                     },
    //                     {
    //                         "user": "Jonsta247",
    //                         "timestamp": "2022-08-30T09:44:38Z"
    //                     },
    //                     {
    //                         "user": "Rlink2",
    //                         "timestamp": "2022-08-17T12:26:04Z"
    //                     },
    //                     {
    //                         "user": "Jonsta247",
    //                         "timestamp": "2022-08-11T13:30:19Z"
    //                     },
    //                     {
    //                         "user": "Jonsta247",
    //                         "timestamp": "2022-08-11T12:32:10Z"
    //                     },
    //                     {
    //                         "user": "The Earwig",
    //                         "timestamp": "2022-07-31T06:05:05Z"
    //                     },
    //                     {
    //                         "user": "87.236.6.14",
    //                         "anon": true,
    //                         "timestamp": "2022-06-07T07:28:44Z"
    //                     },
    //                     {
    //                         "user": "Kku",
    //                         "timestamp": "2022-06-02T06:55:12Z"
    //                     },
    //                     {
    //                         "user": "GreenC bot",
    //                         "timestamp": "2022-05-16T06:22:12Z"
    //                     },
    //                     {
    //                         "user": "Smasongarrison",
    //                         "timestamp": "2022-05-08T06:04:12Z"
    //                     },
    //                     {
    //                         "user": "Chaya5260",
    //                         "timestamp": "2022-04-22T19:05:16Z"
    //                     },
    //                     {
    //                         "user": "WikiCleanerBot",
    //                         "timestamp": "2022-04-22T13:49:44Z"
    //                     },
    //                     {
    //                         "user": "Chaya5260",
    //                         "timestamp": "2022-04-19T22:42:36Z"
    //                     },
    //                     {
    //                         "user": "Vycl1994",
    //                         "timestamp": "2022-03-08T16:48:30Z"
    //                     },
    //                     {
    //                         "user": "DMacks",
    //                         "timestamp": "2022-02-10T03:04:11Z"
    //                     },
    //                     {
    //                         "user": "ZoombomberGuy",
    //                         "timestamp": "2022-02-10T01:38:20Z"
    //                     },
    //                     {
    //                         "user": "Citation bot",
    //                         "timestamp": "2022-02-10T00:30:06Z"
    //                     },
    //                     {
    //                         "user": "Charles Matthews",
    //                         "timestamp": "2022-02-06T03:37:08Z"
    //                     },
    //                     {
    //                         "user": "Oculi",
    //                         "timestamp": "2022-01-31T12:39:17Z"
    //                     },
    //                     {
    //                         "user": "PeterEasthope",
    //                         "timestamp": "2022-01-31T03:16:08Z"
    //                     },
    //                     {
    //                         "user": "Invasive Spices",
    //                         "timestamp": "2022-01-19T18:28:27Z"
    //                     },
    //                     {
    //                         "user": "216.24.45.20",
    //                         "anon": true,
    //                         "timestamp": "2022-01-11T21:24:38Z"
    //                     },
    //                     {
    //                         "user": "InternetArchiveBot",
    //                         "timestamp": "2021-12-28T04:28:01Z"
    //                     },
    //                     {
    //                         "user": "JCW-CleanerBot",
    //                         "timestamp": "2021-12-24T07:54:11Z"
    //                     },
    //                     {
    //                         "user": "Citation bot",
    //                         "timestamp": "2021-12-23T06:37:54Z"
    //                     },
    //                     {
    //                         "user": "Arjayay",
    //                         "timestamp": "2021-12-20T18:45:06Z"
    //                     },
    //                     {
    //                         "user": "HisWormnes",
    //                         "timestamp": "2021-12-20T00:56:47Z"
    //                     },
    //                     {
    //                         "user": "JoeNMLC",
    //                         "timestamp": "2021-12-17T20:42:22Z"
    //                     }
    //                 ]
    //             }
    //         ]
    //         ''',
    //     false);
  });

  test('WikiResponse properly unpacks JSON data', () {
    expect(c_elegans_response.title, 'Caenorhabditis elegans');
    expect(c_elegans_response.revisions.length, 30);
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

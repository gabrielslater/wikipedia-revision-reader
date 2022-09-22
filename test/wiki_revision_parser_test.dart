import 'dart:convert';

import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/read_json.dart';
import 'package:twp_payton_h_gabriel_s/wiki_revision_parser.dart';

void main() async {
  final queries = ['c._elegans', 'pet_door', 'jack_brierley'];
  var revisions = {};

  final revisionParser = RevisionParser();
  int revisionIndex;

  for (String query in queries) {
    var json = jsonDecode(await readJson(query));
    revisions[query] = revisionParser.parse(json);
  }

  group('RevisionParser', () {
    test('RevisionParser created successfully', () {
      expect(revisionParser.runtimeType, RevisionParser);
    });

    for (var revision in revisions.keys) {
      test('parseRevisions returns a list of strings', () {
        expect(revisions[revision].runtimeType, List<String>);
      });
    }

    var expectedRevisions = [30, 30, 12];

    revisionIndex = 0;
    test('parseRevisions returns a list with the correct number of revisions',
        () {
      for (var revision in revisions.keys) {
        expect(revisions[revision].length, expectedRevisions[revisionIndex]);
        revisionIndex++;
      }
    });

    var expectedRevisionLists = [
      [
        '{user: Josve05a, timestamp: 2022-09-16T18:44:51Z}',
        '{user: JCW-CleanerBot, timestamp: 2022-09-04T00:05:04Z}',
        '{user: Jonsta247, timestamp: 2022-08-30T09:49:23Z}',
        '{user: Jonsta247, timestamp: 2022-08-30T09:44:38Z}',
        '{user: Rlink2, timestamp: 2022-08-17T12:26:04Z}',
        '{user: Jonsta247, timestamp: 2022-08-11T13:30:19Z}',
        '{user: Jonsta247, timestamp: 2022-08-11T12:32:10Z}',
        '{user: The Earwig, timestamp: 2022-07-31T06:05:05Z}',
        '{user: 87.236.6.14, anon: true, timestamp: 2022-06-07T07:28:44Z}',
        '{user: Kku, timestamp: 2022-06-02T06:55:12Z}',
        '{user: GreenC bot, timestamp: 2022-05-16T06:22:12Z}',
        '{user: Smasongarrison, timestamp: 2022-05-08T06:04:12Z}',
        '{user: Chaya5260, timestamp: 2022-04-22T19:05:16Z}',
        '{user: WikiCleanerBot, timestamp: 2022-04-22T13:49:44Z}',
        '{user: Chaya5260, timestamp: 2022-04-19T22:42:36Z}',
        '{user: Vycl1994, timestamp: 2022-03-08T16:48:30Z}',
        '{user: DMacks, timestamp: 2022-02-10T03:04:11Z}',
        '{user: ZoombomberGuy, timestamp: 2022-02-10T01:38:20Z}',
        '{user: Citation bot, timestamp: 2022-02-10T00:30:06Z}',
        '{user: Charles Matthews, timestamp: 2022-02-06T03:37:08Z}',
        '{user: Oculi, timestamp: 2022-01-31T12:39:17Z}',
        '{user: PeterEasthope, timestamp: 2022-01-31T03:16:08Z}',
        '{user: Invasive Spices, timestamp: 2022-01-19T18:28:27Z}',
        '{user: 216.24.45.20, anon: true, timestamp: 2022-01-11T21:24:38Z}',
        '{user: InternetArchiveBot, timestamp: 2021-12-28T04:28:01Z}',
        '{user: JCW-CleanerBot, timestamp: 2021-12-24T07:54:11Z}',
        '{user: Citation bot, timestamp: 2021-12-23T06:37:54Z}',
        '{user: Arjayay, timestamp: 2021-12-20T18:45:06Z}',
        '{user: HisWormnes, timestamp: 2021-12-20T00:56:47Z}',
        '{user: JoeNMLC, timestamp: 2021-12-17T20:42:22Z}'
      ],
      [
        '{user: 99.101.56.68, anon: true, timestamp: 2022-06-09T18:19:31Z}',
        '{user: 99.101.56.68, anon: true, timestamp: 2022-05-23T11:38:51Z}',
        '{user: 101.78.69.215, anon: true, timestamp: 2022-03-12T02:07:41Z}',
        '{user: Qwerfjkl (bot), timestamp: 2022-02-05T12:08:05Z}',
        '{user: M3tainfo, timestamp: 2021-12-01T09:51:04Z}',
        '{user: 2603:7080:3540:40:9408:5132:70B1:4E6, anon: true, timestamp: 2021-05-19T17:23:05Z}',
        '{user: Monkbot, timestamp: 2021-02-01T05:34:11Z}',
        '{user: ClueBot NG, timestamp: 2021-01-19T22:36:47Z}',
        '{user: 69.72.122.49, anon: true, timestamp: 2021-01-19T22:36:43Z}',
        '{user: V1adis1av, timestamp: 2021-01-05T12:52:45Z}',
        '{user: IdreamofJeanie, timestamp: 2020-03-10T18:17:36Z}',
        '{user: 112.196.52.43, anon: true, timestamp: 2020-03-10T17:45:04Z}',
        '{user: 112.196.52.43, anon: true, timestamp: 2020-03-10T17:44:38Z}',
        '{user: LizzieBabes419, timestamp: 2020-03-07T15:46:33Z}',
        '{user: 79.65.138.187, anon: true, timestamp: 2020-02-18T15:38:24Z}',
        '{user: MarialeegRVT, timestamp: 2019-12-17T02:44:51Z}',
        '{user: DumbBOT, timestamp: 2019-11-11T01:40:07Z}',
        '{user: MelanieN, timestamp: 2019-11-09T00:28:08Z}',
        '{user: MelanieN, timestamp: 2019-11-09T00:28:08Z}',
        '{user: CentralTime301, timestamp: 2019-11-08T18:26:31Z}',
        '{user: 189.152.141.127, anon: true, timestamp: 2019-11-08T18:23:46Z}',
        '{user: CentralTime301, timestamp: 2019-11-08T18:21:14Z}',
        '{user: 189.207.58.81, anon: true, timestamp: 2019-11-08T18:20:09Z}',
        '{user: ClueBot NG, timestamp: 2019-11-08T18:19:36Z}',
        '{user: 189.207.58.81, anon: true, timestamp: 2019-11-08T18:19:34Z}',
        '{user: Arjayay, timestamp: 2019-10-20T11:28:58Z}',
        '{user: 72.24.231.49, anon: true, timestamp: 2019-10-19T15:09:06Z}',
        '{user: 143.52.95.218, anon: true, timestamp: 2019-10-16T10:28:22Z}',
        '{user: 143.52.95.218, anon: true, timestamp: 2019-10-16T10:28:05Z}',
        '{user: Pseudomonas, timestamp: 2019-08-23T10:46:41Z}'
      ],
      [
        '{user: WereSpielChequers, timestamp: 2022-06-01T19:44:08Z}',
        '{user: Mickh~enwiki, timestamp: 2022-04-13T12:36:42Z}',
        '{user: GoodDay, timestamp: 2021-10-03T03:23:12Z}',
        '{user: ImageRemovalBot, timestamp: 2020-10-08T23:56:06Z}',
        '{user: Waacstats, timestamp: 2020-08-22T13:19:07Z}',
        '{user: Vox3000, timestamp: 2020-05-22T00:54:22Z}',
        '{user: Hugh 3476, timestamp: 2019-07-29T18:42:05Z}',
        '{user: Magic links bot, timestamp: 2019-07-26T16:07:39Z}',
        '{user: Sully198787, timestamp: 2019-07-26T08:36:15Z}',
        '{user: Vox3000, timestamp: 2019-07-26T01:16:54Z}',
        '{user: Vox3000, timestamp: 2019-07-26T01:13:24Z}',
        '{user: Vox3000, timestamp: 2019-07-26T01:12:56Z}'
      ],
    ];

    test('parseRevison correctly splits strings', () {
      revisionIndex = 0;

      for (var revision in revisions.keys) {
        for (var item = 0; item < revisions[revision].length; item++) {
          expect(revisions[revision][item],
              expectedRevisionLists[revisionIndex][item]);
        }
        revisionIndex++;
      }
    });
  });
}

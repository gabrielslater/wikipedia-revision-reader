import 'dart:convert';

void main() async {
  // string of revisions to cut down on the test cases that need to be verified
  String revisions = '{"revisions":['
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

  var json = jsonDecode(revisions)[revisions];

  // Outline of Revision class
  // Revision
  //     - String user
  //     - bool isAnon
  //     - DateTime timestamp
}

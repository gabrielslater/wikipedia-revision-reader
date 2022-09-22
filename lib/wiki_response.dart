import 'package:twp_payton_h_gabriel_s/wiki_revision_parser.dart';

class WikiResponse {
  final String title;
  final List<String> revisions;

  // what should an empty redirect be in the end?
  final Map<String, dynamic> redirect;

  WikiResponse(this.title, this.revisions, this.redirect);

  factory WikiResponse.fromJson(Map<String, dynamic> json) {
    // TODO: this needs to be moved
    // surely this shouldn't be declared in here -- maybe in a parent class?
    // should parseRevisions() be part of a response? probably not.
    final RevisionParser revisionParser = RevisionParser();

    var revisions = revisionParser.parseRevisions(json);
    return WikiResponse(
        json['query']['pages'][0]['title'],
        revisions,
        // If there is no redirect, return an empty map, otherwise return the
        // redirect map.
        (json['query']['redirects'] != null)
            ? json['query']['redirects'][0]
            : {});
  }
}

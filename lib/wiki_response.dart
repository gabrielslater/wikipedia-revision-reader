import 'package:twp_payton_h_gabriel_s/wiki_revision.dart';

class WikiResponse {
  final String title;
  final List<WikiRevision> revisions;

  // what should an empty redirect be in the end?
  final Map<String, dynamic> redirect;
  final bool isPage;

  WikiResponse(this.title, this.revisions, this.redirect, this.isPage);

  factory WikiResponse.fromJson(Map<String, dynamic> json) {
    var pageId = json['query']['pages'].keys.toList().first;
    var page = json['query']['pages'][pageId];

    return WikiResponse(
        page['title'],
        // https://stackoverflow.com/questions/60105956/how-to-cast-dynamic-to-liststring#60106251
        // Map each item in the "revisions" to a string for now.
        (page['revisions'] as List)
            .map((item) => WikiRevision.fromJson(item))
            .toList(),
        // If there is no redirect, return an empty map, otherwise return the
        // redirect map.
        (json['query']['redirects'] != null)
            ? json['query']['redirects'][0]
            : {},
        page == '-1');
  }
}

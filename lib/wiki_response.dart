class WikiResponse {
  final String title;
  final List<String> revisions;

  // what should an empty redirect be in the end?
  final Map<String, dynamic> redirect;

  WikiResponse(this.title, this.revisions, this.redirect);

  WikiResponse.fromJson(Map<String, dynamic> json)
      : title = json['query']['pages'][0]['title'],
        // https://stackoverflow.com/questions/60105956/how-to-cast-dynamic-to-liststring#60106251
        // Map each item in the "revisions" to a string for now.
        revisions = (json['query']['pages'][0]['revisions'] as List)
            .map((e) => e.toString())
            .toList(),
        // If there is no redirect, return an empty map, otherwise return the
        // redirect map.
        redirect = (json['query']['redirects'] != null)
            ? json['query']['redirects'][0]
            : {};
}

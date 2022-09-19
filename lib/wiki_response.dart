class WikiResponse {
  // final String content;
  final String title;
  final List<String> revisions;

  // what should an empty redirect be in the end?
  final Map<String, dynamic> redirect;

  WikiResponse(this.title, this.revisions, this.redirect);

  WikiResponse.fromJson(Map<String, dynamic> json)
      : title = json['query']['pages'][0]['title'],
        // https://stackoverflow.com/questions/60105956/how-to-cast-dynamic-to-liststring#60106251,
        revisions = (json['query']['pages'][0]['revisions'] as List)
            .map((e) => e.toString())
            .toList(),
        redirect = (json['query']['redirects'] != null)
            ? json['query']['redirects'][0]
            : {};
}

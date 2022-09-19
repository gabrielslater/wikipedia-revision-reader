class WikiResponse {
  // final String content;
  final String title;
  final List<String> revisions;

  WikiResponse(this.title, this.revisions);

  WikiResponse.fromJson(Map<String, dynamic> json)
      : title = json['query']['pages'][0]['title'],
        // https://stackoverflow.com/questions/60105956/how-to-cast-dynamic-to-liststring#60106251,
        revisions = (json['query']['pages'][0]['revisions'] as List)
            .map((e) => e.toString())
            .toList();
}

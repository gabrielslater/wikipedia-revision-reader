class RevisionParser {
  List<String> parseRevisions(Map<String, dynamic> json) {
    var revisions = json['query']['pages'][0]['revisions'];
    // https://stackoverflow.com/questions/60105956/how-to-cast-dynamic-to-liststring#60106251
    // Map each item in the "revisions" to a string for now.
    return (revisions as List).map((item) => item.toString()).toList();
  }
}

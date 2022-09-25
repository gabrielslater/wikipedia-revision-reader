class QueryBuilder {
  String build(String query) {
    return 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=$query&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30';
  }
}

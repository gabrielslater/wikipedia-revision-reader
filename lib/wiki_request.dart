import 'package:http/http.dart' as http;

class WikiRequest {
  Future<http.Response> fetchPage(String query) {
    return http.get(Uri.parse(buildQuery(query)));
  }

  String buildQuery(String query) {
    return 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=$query&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30';
  }
}

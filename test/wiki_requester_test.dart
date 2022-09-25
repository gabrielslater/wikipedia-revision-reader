import 'package:test/test.dart';
import 'package:twp_payton_h_gabriel_s/wiki_requester.dart';

void main() {
  // urls are created in the form of
  // https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=<NAME>&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30

  var queries = {
    'Soup':
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=Soup&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30',
    'Dog':
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=Dog&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30',
    'Joe Biden':
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=Joe Biden&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30',
  };

  group('buildQuery', () {
    for (var query in queries.keys) {
      test('URL is formatted correctly', () {
        var url = WikiRequester().buildQuery(query);
        expect(url, queries[query]);
      });
    }
  });
}

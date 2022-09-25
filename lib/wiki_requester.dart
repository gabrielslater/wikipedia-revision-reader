import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twp_payton_h_gabriel_s/wiki_response.dart';

class WikiRequester {
  Future<WikiResponse> fetchPage(String query) async {
    var uri = Uri.parse(buildQuery(query));
    var response = await http.read(uri, headers: {
      'user-agent':
          'Revision Reader/0.1.0 (https://github.com/bsu-cs222/twp-payton.h-gabriel.s; syslater@bsu.edu)'
    });

    var json = jsonDecode(response);

    return WikiResponse.fromJson(json);
  }

  String buildQuery(String query) {
    return 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=$query&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30';
  }
}

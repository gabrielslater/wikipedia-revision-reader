import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:twp_payton_h_gabriel_s/wiki_response.dart';

class WikiRequest {
  WikiResponse? response;
  bool isPage = true;
  bool canConnect = true;

  Future<bool> fetchPage(String query) async {
    var uri = Uri.parse(buildQuery(query));

    try {
      var response = await http.read(uri, headers: {
        'user-agent':
            'Revision Reader/0.1.1 (https://github.com/bsu-cs222/twp-payton.h-gabriel.s; syslater@bsu.edu)'
      });

      var json = jsonDecode(response);

      this.response = WikiResponse.fromJson(json);

      if (this.response!.title != '') {
        isPage = true;
      } else {
        this.response = null;
        isPage = false;
      }
    } on SocketException {
      isPage = false;
      canConnect = false;
    }

    return true;
  }

  String buildQuery(String query) {
    return 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=$query&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30';
  }
}

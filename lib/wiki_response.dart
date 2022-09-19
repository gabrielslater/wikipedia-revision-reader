class WikiResponse {
  final String content;

  WikiResponse(this.content);

  WikiResponse.fromJson(Map<String, dynamic> json)
      : content = json['query'].toString();
}

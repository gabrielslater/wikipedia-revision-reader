class WikiRevision {
  final String user;
  final bool isAnon;

  WikiRevision(this.user, this.isAnon);

  WikiRevision.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        isAnon = (json['anon'] != null ? true : false);
}

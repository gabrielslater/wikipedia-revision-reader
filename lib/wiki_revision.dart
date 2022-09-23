class WikiRevision {
  final String user;

  WikiRevision(this.user);

  WikiRevision.fromJson(Map<String, dynamic> json) : user = json['user'];
}

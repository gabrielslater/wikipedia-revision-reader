class WikiRevision {
  final String user;
  final bool isAnon;
  final DateTime timestamp;

  WikiRevision(this.user, this.isAnon, this.timestamp);

  WikiRevision.fromJson(Map<String, dynamic> json)
      : user = (json['userhidden'] != null ? '' : json['user']),
        isAnon =
            (json['anon'] != null || json['userhidden'] != null ? true : false),
        timestamp = DateTime.parse(json['timestamp']);
}

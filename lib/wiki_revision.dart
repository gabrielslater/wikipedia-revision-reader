class Revision {
  final String user;

  Revision(this.user);

  Revision.fromJson(Map<String, dynamic> json) : user = json['user'];
}

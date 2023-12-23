class userchat {
  final String userchatname;

  userchat(this.userchatname);

  factory userchat.fromJson(jsonData) {
    return userchat(jsonData['username']);
  }
}

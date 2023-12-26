// ignore_for_file: camel_case_types

class chatuser {
  final String userchatname;

  chatuser(this.userchatname);

  factory chatuser.fromJson(jsonData) {
    return chatuser(jsonData['username']);
  }
}

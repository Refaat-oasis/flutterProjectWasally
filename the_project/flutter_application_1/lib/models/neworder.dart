class Neworder {
  final String fromstreet;
  final String tostreet;
  final String fromphone;

  Neworder(this.fromstreet, this.tostreet, this.fromphone);
  

  factory Neworder.fromJson(jsonData) {
    return Neworder(
        jsonData['fromstreet'], jsonData['tostreet'], jsonData['fromphone']);
  }
}

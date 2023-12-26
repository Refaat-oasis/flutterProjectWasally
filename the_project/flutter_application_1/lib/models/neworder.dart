class Neworder {
  final String fromstreet;
  final String tostreet;
  final String fromphone;
  final String deliverymethod;

  Neworder(this.fromstreet, this.tostreet, this.fromphone, this.deliverymethod);

  factory Neworder.fromJson(jsonData) {
    return Neworder(jsonData['fromstreet'], jsonData['tostreet'],
        jsonData['fromphone'], jsonData['deliverymethod']);
  }
}

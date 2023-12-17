// ignore: camel_case_types
// ignore_for_file: unnecessary_this

// ignore: camel_case_types
class newOrder {
  final String startpoint;
  final String endpoint;
  final String senderphone;
  String price;

  // newOrder() {
  //   ({startpoint, endpoint, senderphone, (price ?? "20")});
  // }
  newOrder(
      {required this.startpoint,
      required this.endpoint,
      required this.senderphone,
      this.price = '20'});

  // factory newOrder.fromJson(jsonData) {
  //   return newOrder(  jsonData['fromstreet'] , jsonData['tostreet'] , jsonData['fromphone'] );
  // }
}

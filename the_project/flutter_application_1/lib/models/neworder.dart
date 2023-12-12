// ignore: camel_case_types
// ignore_for_file: unnecessary_this

class newOrder {
  String? startpoint;
  String? endpoint;
  String? senderphone;
  String? price;

  newOrder() {
    ({startpoint, endpoint, senderphone, (price ?? "20")});
  }
}

class Orders {
  String address;
  bool is_med;
  String person_uid;
  Map<String, dynamic> products;
  String type;

  Orders(
      {this.address, this.is_med, this.person_uid, this.products, this.type});

  Orders.fromJson(Map<String, dynamic> parsedJson)
      : address = parsedJson['address'] ?? '',
        is_med = parsedJson['is_med'] ?? '',
        person_uid = parsedJson['person_uid'] ?? '',
        products = parsedJson['products'] ?? '',
        type = parsedJson['type'] ?? '';
}

class Orders {
  String address;
  bool is_med;
  String person_uid;
  double latitude;
  double longitude;
  Map<String, dynamic> products;
  String type;

  Orders(
      {this.address,
      this.is_med,
      this.person_uid,
      this.products,
      this.type,
      this.longitude,
      this.latitude});

  Orders.fromJson(Map<String, dynamic> parsedJson)
      : address = parsedJson['address'] ?? '',
        latitude = parsedJson['lat'] ?? '',
        longitude = parsedJson['long'] ?? '',
        is_med = parsedJson['is_med'] ?? '',
        person_uid = parsedJson['person_uid'] ?? '',
        products = parsedJson['products'] ?? '',
        type = parsedJson['type'] ?? '';
}

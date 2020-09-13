class Orders {
  String address;
  bool is_med;
  String person_uid;
  double latitude;
  double longitude;
  Map<String, dynamic> products;
  String type;
  String vendor_uid;
  String volunteer_uid;

  Orders(
      {this.address,
      this.is_med,
      this.person_uid,
      this.products,
      this.type,
      this.longitude,
      this.latitude,
      this.vendor_uid,
      this.volunteer_uid});

  Orders.fromJson(Map<String, dynamic> parsedJson)
      : address = parsedJson['address'] ?? '',
        latitude = parsedJson['lat'] ?? '',
        longitude = parsedJson['long'] ?? '',
        is_med = parsedJson['is_med'] ?? '',
        person_uid = parsedJson['person_uid'] ?? '',
        products = parsedJson['products'] ?? '',
        type = parsedJson['type'] ?? '',
        vendor_uid = parsedJson['vendor_uid'] ?? '',
        volunteer_uid = parsedJson['volunteer_uid'] ?? '';
}

class Orders {
  String address;
  bool is_med;
  String person_uid;
  double latitude;
  double longitude;
  Map<String, dynamic> products;
  String type;
  String uid;
  String volunteer_uid;

  Orders(
      {this.address,
      this.is_med,
      this.person_uid,
      this.products,
      this.type,
      this.longitude,
      this.latitude,
      this.volunteer_uid});

  Orders.fromJson(Map<String, dynamic> parsedJson)
      : address = parsedJson['address'] ?? '',
        latitude = parsedJson['lat'] ?? '',
        longitude = parsedJson['long'] ?? '',
        is_med = parsedJson['is_med'] ?? '',
        person_uid = parsedJson['person_uid'] ?? '',
        products = parsedJson['products'] ?? '',
        type = parsedJson['type'] ?? '',
        volunteer_uid = parsedJson['volunteer_uid'] ?? '';

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['address'] = this.address;
    dataMap['lat'] = this.latitude;
    dataMap['long'] = this.longitude;
    dataMap['is_med'] = this.is_med;
    dataMap['person_uid'] = this.person_uid;
    dataMap['products'] = this.products;
    dataMap['type'] = this.type;
    return dataMap;
  }

}

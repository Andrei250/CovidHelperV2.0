/// Class with the details about a vendor

class Vendor {
  const Vendor(
      {this.name, this.email, this.phoneNumber, this.uid, this.coordinates, this.address});

  final String address;
  final String coordinates;
  final String name;
  final String email;
  final String phoneNumber;
  final String uid;

  Vendor.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'] ?? '',
        email = parsedJson['email'] ?? '',
        phoneNumber = parsedJson['phoneNumber'] ?? '',
        coordinates = parsedJson['coordinates'] ?? '',
        address = parsedJson['address'] ?? '',
        uid = parsedJson['uid'] ?? '';

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['name'] = this.name;
    dataMap['email'] = this.email;
    dataMap['phoneNumber'] = this.phoneNumber;
    dataMap['coordinates'] = this.coordinates;
    dataMap['address'] = this.address;
    dataMap['uid'] = this.uid;
    return dataMap;
  }
}

/// Class with the details about a vendor

class Vendor {
  const Vendor(
      {this.name, this.email, this.phoneNumber, this.address, this.uid});

  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String uid;

  Vendor.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'] ?? '',
        email = parsedJson['email'] ?? '',
        phoneNumber = parsedJson['phoneNumber'] ?? '',
        address = parsedJson['address'] ?? '',
        uid = parsedJson['uid'] ?? '';

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['name'] = this.name;
    dataMap['email'] = this.email;
    dataMap['phoneNumber'] = this.phoneNumber;
    dataMap['address'] = this.address;
    dataMap['uid'] = this.uid;
    return dataMap;
  }
}

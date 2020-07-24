import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class VulnerablePerson {
  // ignore: non_constant_identifier_names
  String first_name;
  // ignore: non_constant_identifier_names
  String last_name;
  String uid;
  String address;
  String phone;
  String email;

  VulnerablePerson({this.first_name, this.last_name, this.address, this.email, this.phone, this.uid});

  VulnerablePerson.fromJson(Map<String, dynamic> parsedJson)
    : first_name = parsedJson['first_name'] ?? '',
      last_name = parsedJson['last_name'] ?? '',
      uid = parsedJson['uid'] ?? '',
      address = parsedJson['address'] ?? '',
      email = parsedJson['email'] ?? '',
      phone = parsedJson['phone'] ?? '';

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['first_name'] = this.first_name;
    dataMap['last_name'] = this.last_name;
    dataMap['address'] = this.address;
    dataMap['email'] = this.email;
    dataMap['phone'] = this.phone;
    return dataMap;
  }


}
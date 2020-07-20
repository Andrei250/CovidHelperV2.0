import 'User.dart';

class VulnerablePerson extends User {
  // ignore: non_constant_identifier_names
  String first_name;
  // ignore: non_constant_identifier_names
  String last_name;
  String address;
  String phone;

  VulnerablePerson(String uid,
      String email,
      String user_value,
      String first_name,
      String last_name,
      String address,
      String phone) {
    User(uid: uid, user_value: user_value, email: email);
    this.first_name = first_name;
    this.last_name = last_name;
    this.address = address;
    this.phone = phone;
  }
}
import 'package:covidhelper_v2/services/firestore_service.dart';

class RegisterBack {
  RegisterBack(
      {this.name, this.email, this.phoneNumber, this.password, this.userValue});

  String name;
  String email;
  String phoneNumber;
  String password;
  String userValue;

  String message = 'Success';

  final FirestoreService _service = new FirestoreService();

  Future addNewUser() async {
    dynamic result = await _service.createVendorVolunteer(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        userValue: userValue);
    if (result == null) {
      message = 'Error on adding new user!';
    }
    print(message);
  }
}

import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

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
    print(name);
    print(email);
    print(phoneNumber);
    print(password);
    print('00000000000000000000000000000000000000000000');
    if (result == null) {
      message = 'Error on adding new user!';
    }
    print(message);
  }
}

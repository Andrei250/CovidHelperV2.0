import 'package:covidhelper_v2/services/firestore_service.dart';

class RegisterBack {
  RegisterBack({this.name, this.email, this.phoneNumber, this.password});

  String name;
  String email;
  String phoneNumber;
  String password;

  String message = 'Success';

  final FirestoreService _service = new FirestoreService();

  Future addNewUser() async {
    dynamic result = await _service.createUser(
        name: name, email: email, phoneNumber: phoneNumber, password: password);
    if (result == null) {
      message = 'Error on adding new user!';
    }
    print(message);
  }
}

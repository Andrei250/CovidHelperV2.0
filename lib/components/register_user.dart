import 'package:covidhelper_v2/components/form_input.dart';
import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final FirestoreService _service = new FirestoreService();

  String email = '';
  String password = '';
  String phone = '';
  String address = '';
  String first_name = '';
  String last_name = '';

  String emptyness_error = '';
  String password_error = '';
  String email_error = '';
  String phone_error = '';

  String message = '';

  @override
  Widget build(BuildContext context) {
    void changePassword(String val) {
        password = val;
    }

    void changeEmail(String val) {
      email = val;
    }

    void changeFirstName(String val) {
      first_name = val;
    }

    void changeLastName(String val) {
      last_name = val;
    }

    void changeAddress(String val) {
      address = val;
    }

    void changePhone(String val) {
      phone = val;
    }

    bool inputValidate() {
      message = '';
      if (password.isEmpty || email.isEmpty || phone.isEmpty ||
          last_name.isEmpty || first_name.isEmpty || address.isEmpty) {
        emptyness_error = 'All fields are required';
        return false;
      }

      if (password.length < 6) {
        password_error = 'Password must have more than 6 characters';
        return false;
      }

      if (!EmailValidator.validate(email)) {
        email_error = 'Invalid email';
        return false;
      }

      return true;
    }

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  Text('Add a Vulnerable Person',
                    style: AppTheme.darkTheme.textTheme.headline2,
                  ),
                  SizedBox(
                    height: 20.0,
                    child: Text(
                      '${message}',
                      style: AppTheme.darkTheme.textTheme.subtitle2,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 70.0,
                    child: FormInput(
                      label: 'Email',
                      type: false,
                      changeValue: changeEmail,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 70.0,
                    child: FormInput(
                      label: 'Password',
                      type: true,
                      changeValue: changePassword
                      ),
                    ),
                  SizedBox(
                    width: 320.0,
                    height: 70.0,
                    child: FormInput(
                      label: 'Phone',
                      type: false,
                      changeValue: changePhone,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 70.0,
                    child: FormInput(
                      label: 'Address',
                      type: false,
                      changeValue: changeAddress,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 70.0,
                    child: FormInput(
                      label: 'First Name',
                      type: false,
                      changeValue: changeFirstName,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 70.0,
                    child: FormInput(
                      label: 'Last Name',
                      type: false,
                      changeValue: changeLastName,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    child: Text(
                      '${emptyness_error}',
                      style: AppTheme.darkTheme.textTheme.subtitle2,
                    ),
                  ),
                  RaisedButton(
                    color: AppTheme.darkTheme.buttonColor,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () async {
                      if (!inputValidate()) {
                        setState(() {

                        });
                      } else {
                        print(email);
                        emptyness_error = '';
                        email_error = '';
                        password_error = '';
                        message = 'Successfully added';
                        dynamic result = await _service.createVulnerablePerson(email, password, address, phone, first_name, last_name);
                        if (result == null) {
                          message = 'Error on adding new user!';
                        }
                        setState(() {

                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

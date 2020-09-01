import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'vulnerable/new_text_field.dart';

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
  String message = '';
  String emailError = '';
  String passwordError = '';
  String firstNameError = '';
  String lastNameError = '';
  String phoneError = '';
  String addressError = '';
  bool added = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    var _controllerEmail = TextEditingController();
    var _controllerPassword = TextEditingController();
    var _controllerFirstName = TextEditingController();
    var _controllerLastName = TextEditingController();
    var _controllerPhone = TextEditingController();
    var _controllerAddress = TextEditingController();

    void clearText() {
      _controllerEmail.clear();
      _controllerPassword.clear();
      _controllerFirstName.clear();
      _controllerLastName.clear();
      _controllerPhone.clear();
      _controllerAddress.clear();
    }

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

    void verifyEmail() {
      if (email.isEmpty) {
        emailError = 'empty';
      } else if (EmailValidator.validate(email) == false) {
        emailError = 'invalid';
      } else {
        emailError = '';
      }
    }

    void verifyPassword() {
      if (password.isEmpty) {
        passwordError = 'empty';
      } else if (password.length < 6) {
        passwordError = 'short';
      } else {
        passwordError = '';
      }
    }

    void verifyName() {
      if (first_name.isEmpty) {
        firstNameError = 'empty';
      } else {
        firstNameError = '';
      }
      if (last_name.isEmpty) {
        lastNameError = 'empty';
      } else {
        lastNameError = '';
      }
      // TODO add name validator
    }

    void verifyPhone() {
      if (phone.isEmpty) {
        phoneError = 'empty';
      } else if (phone[0] != '0' || phone.length != 10) {
        phoneError = 'invalid';
      } else {
        phoneError = '';
      }
    }

    void verifyAddress() {
      if (address.isEmpty) {
        addressError = 'empty';
      } else {
        addressError = '';
      }
      // TODO add address validator
    }

    void showMessage() {
      verifyEmail();
      verifyPassword();
      verifyName();
      verifyPhone();
      verifyAddress();

      if (emailError == 'empty' ||
          passwordError == 'empty' ||
          firstNameError == 'empty' ||
          lastNameError == 'empty' ||
          phoneError == 'empty' ||
          addressError == 'empty') {
        message = 'Toate campurile sunt obligatorii!';
      } else if (emailError == 'invalid') {
        message = 'Introduceti o adresa de email valida!';
      } else if (passwordError == 'short') {
        message = 'Parola trebuie sa contina minim 6 caracrere';
      } else if (phoneError == 'invalid') {
        message = 'Intoduceti un numar de telefon valid!';
      } else {
        message = '';
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 5.0),
        child: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          bottom: _loading
              ? PreferredSize(
                  preferredSize: Size(double.infinity, 1.0),
                  child: LinearProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppTheme.lightAccent),
                  ),
                )
              : null,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  Text(
                    'Adauga o persoana vulnerabila',
                    style: eTitle,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 80.0,
                    child: NewTextField(
                      label: 'Email',
                      type: false,
                      error: emailError,
                      controller: _controllerEmail,
                      changeValue: changeEmail,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 80.0,
                    child: NewTextField(
                        label: 'Parola',
                        type: true,
                        error: passwordError,
                        controller: _controllerPassword,
                        changeValue: changePassword),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 80.0,
                    child: NewTextField(
                      label: 'Prenume',
                      type: false,
                      error: firstNameError,
                      controller: _controllerFirstName,
                      changeValue: changeFirstName,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 80.0,
                    child: NewTextField(
                      label: 'Nume',
                      type: false,
                      error: lastNameError,
                      controller: _controllerLastName,
                      changeValue: changeLastName,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 80.0,
                    child: NewTextField(
                      label: 'Telefon',
                      type: false,
                      error: phoneError,
                      controller: _controllerPhone,
                      inputType: TextInputType.number,
                      changeValue: changePhone,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 80.0,
                    child: NewTextField(
                      label: 'Adresa',
                      type: false,
                      error: addressError,
                      controller: _controllerAddress,
                      changeValue: changeAddress,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    child: Text(
                      '${message}',
                      style: added == true ? eWelcome : eWarning,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: AppTheme.lightAccent,
                      child: Text('Adauga persoana', style: eButton),
                      onPressed: () async {
                        showMessage();
                        setState(() {});
                        if (emailError.isEmpty &&
                            passwordError.isEmpty &&
                            firstNameError.isEmpty &&
                            lastNameError.isEmpty &&
                            phoneError.isEmpty &&
                            addressError.isEmpty) {
                          _loading = true;
                          dynamic result =
                              await _service.createVulnerablePerson(
                                  email,
                                  password,
                                  address,
                                  phone,
                                  first_name,
                                  last_name);
                          if (result == null) {
                            added = false;
                            message =
                                'A aparut o eroare, incercati mai traziu!';
                          } else {
                            added = true;
                            message = 'Persoana a fost adaugata cu succes!';
                            Future.delayed(const Duration(milliseconds: 1000), () {
                              // clearText();
                            });
                          }
                          _loading = false;
                          setState(() {});
                        }
                      }
                      // },
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

import 'package:covidhelper_v2/pages/register/register_two_texts.dart';
import 'package:flutter/material.dart';

class RegisterPassword extends StatefulWidget {
  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  String password;
  String passwordConfirm;
  String errorFirstText;
  String errorSecondText;

  @override
  Widget build(BuildContext context) {
    bool passwordOk = false;
    bool passwordConfirmOk = false;

    void changePassword(String val) {
      password = val;
    }

    void changePasswordConfirm(String val) {
      passwordConfirm = val;
    }

    void verifyPassword() {
      if (password == null) {
        errorFirstText = 'Alegeti o parola!';
      } else if (password.length < 6) {
        errorFirstText = 'Parola trebuie sa contina minim 6 caractere!';
      } else if (password == null && passwordConfirm != null) {
        errorFirstText = 'Alegeti o parola!';
      } else {
        errorFirstText = null;
        passwordOk = true;
      }
    }

    void verifyPasswordConfirm() {
      if (passwordConfirm == null && password != null) {
        errorSecondText = 'Confirmati parola!';
      } else if (password != null && passwordConfirm != password) {
        errorSecondText = 'Parolele nu coincid';
      } else {
        errorSecondText = null;
        passwordConfirmOk = true;
      }
    }

    void verifyBothPasswords() {
      verifyPassword();
      verifyPasswordConfirm();
    }

    return Container(
        child: RegisterTwoTexts(
      labelOne: 'Parola',
      labelTwo: 'Confirmati parola',
      welcomeTextBig: 'Alegeti o parola',
      welcomeTextSmall: 'Indroduceti parola',
      passwordText: true,
      inputType: TextInputType.text,
      route: '/register_password',
      changeFirstValue: changePassword,
      changeSecondValue: changePasswordConfirm,
      onPressed: () {
        setState(() {
          verifyBothPasswords();
          if (passwordOk == true && passwordConfirmOk == true) {
            Navigator.of(context).pushNamed('/loading', arguments: password);
          }
        });
      },
      errorFirstText: errorFirstText,
      errorSecondText: errorSecondText,
    ));
  }
}

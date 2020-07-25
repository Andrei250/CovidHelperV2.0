import 'package:flutter/material.dart';

import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/register/register_two_texts.dart';

class RegisterPassword extends StatefulWidget {
  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  String password;
  String passwordConfirm;

  @override
  Widget build(BuildContext context) {
    void changePassword(String val) {
      password = val;
    }

    void changePasswordConfirm(String val) {
      passwordConfirm = val;
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
        Navigator.of(context).pushNamed('/home', arguments: password);
      },
    ));
  }
}

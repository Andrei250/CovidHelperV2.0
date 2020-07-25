import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/register/register_one_text.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  String email;
  String errorText;

  @override
  Widget build(BuildContext context) {
    bool emailOk;

    void changeEmail(String val) {
      email = val;
    }

    void verifyEmail() {
      if (email == null) {
        errorText = 'Introduceti adresa de email!';
        emailOk = false;
      } else {
        bool isValid = EmailValidator.validate(email);
        if (isValid == false) {
          errorText = 'Introduceti o adresa de email valida!';
          emailOk = false;
        } else {
          errorText = null;
          emailOk = true;
        }
      }
    }

    return Container(
        child: RegisterOneText(
      label: 'Email',
      welcomeTextBig: 'Creati un cont nou',
      welcomeTextSmall: 'Indroduceti adresa de email',
      inputType: TextInputType.text,
      passwordText: false,
      route: '/register_email',
      changeValue: changeEmail,
      onPressed: () {
        setState(() {
          verifyEmail();
          if (emailOk == true) {
            Navigator.of(context)
                .pushNamed('/register_phone', arguments: email);
          }
        });
      },
      errorText: errorText,
    ));
  }
}

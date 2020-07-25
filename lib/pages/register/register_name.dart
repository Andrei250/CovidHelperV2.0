import 'package:covidhelper_v2/pages/register/register_one_text.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';

class RegisterName extends StatefulWidget {
  @override
  _RegisterNameState createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  String name;
  String errorText;

  @override
  Widget build(BuildContext context) {
    bool nameOk = false;

    void changeName(String val) {
      name = val;
    }

    void verifyName() {
      if (name == null) {
        errorText = 'Introduceti numele si prenumele!';
      } else if (validator.name(name) == false) {
        errorText = 'Indroduceti corect numele!';
      } else {
        errorText = null;
        nameOk = true;
      }
    }

    return Container(
        child: RegisterOneText(
      label: 'Numele si prenumele',
      welcomeTextBig: 'Numele si prenumele',
      welcomeTextSmall: 'Indroduceti numele si prenumele',
      inputType: TextInputType.text,
      passwordText: false,
      route: '/register_name',
      changeValue: changeName,
      onPressed: () {
        setState(() {
          verifyName();
          if (nameOk == true) {
            Navigator.of(context).pushNamed('/register_email', arguments: name);
          }
        });
      },
      errorText: errorText,
    ));
  }
}

import 'package:flutter/material.dart';

import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/register/register_one_text.dart';

class RegisterName extends StatefulWidget {
  @override
  _RegisterNameState createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  String name;

  @override
  Widget build(BuildContext context) {
    void changeName(String val) {
      name = val;
//    print(name);
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
        Navigator.of(context).pushNamed('/register_email', arguments: name);
      },
    ));
  }
}

import 'package:covidhelper_v2/pages/register_one_text.dart';
import 'package:flutter/material.dart';

class RegisterName extends StatefulWidget {
  @override
  _RegisterNameState createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RegisterOneText(
      label: 'Numele si prenumele',
      welcomeTextBig: 'Numele si prenumele',
      welcomeTextSmall: 'Indroduceti numele si prenumele',
      inputType: TextInputType.text,
      passwordText: false,
      onPressed: () {
          Navigator.of(context).pushNamed('/register_email');
        },
          route: '/register_name',
    ));
  }
}

import 'package:covidhelper_v2/pages/register/register_one_text.dart';
import 'package:flutter/material.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RegisterOneText(
          label: 'Email',
          welcomeTextBig: 'Creati un cont nou',
          welcomeTextSmall: 'Indroduceti adresa de email',
          inputType: TextInputType.text,
          passwordText: false,
          onPressed: () {
            Navigator.of(context).pushNamed('/register_phone');
          },
          route: '/register_email',
        ));
  }
}

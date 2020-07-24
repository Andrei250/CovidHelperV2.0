import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/register/register_two_texts.dart';
import 'package:flutter/material.dart';

class RegisterPassword extends StatefulWidget {
  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RegisterTwoTexts(
      labelOne: 'Parola',
      labelTwo: 'Confirmati parola',
      welcomeTextBig: 'Alegeti o parola',
      welcomeTextSmall: 'Indroduceti parola',
      passwordText: true,
      inputType: TextInputType.text,
          onPressed: () {
            Navigator.of(context).pushNamed('/register_email');
          },
          route: '/register_password',

    ));
  }
}

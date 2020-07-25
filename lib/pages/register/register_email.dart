import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/register/register_one_text.dart';
import 'package:flutter/material.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  String email;

  @override
  Widget build(BuildContext context) {
   void changeEmail (String val) {
     email = val;
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
            Navigator.of(context).pushNamed('/register_phone', arguments: email);
          },
        ));
  }
}

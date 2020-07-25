import 'package:flutter/material.dart';

import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/register/register_one_text.dart';

class RegisterPhone extends StatefulWidget {
  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    void changePhoneNumber (String val) {
      phoneNumber = val;
    }

    return Container(
        child: RegisterOneText(
      label: 'Telefon',
      welcomeTextBig: 'Numar de telefon',
      welcomeTextSmall: 'Indroduceti numarul de telefon',
      inputType: TextInputType.number,
      passwordText: false,
      route: '/register_phone',
      changeValue: changePhoneNumber,
      onPressed: () {
        Navigator.of(context).pushNamed('/register_password', arguments: phoneNumber);

      },
    ));
  }
}

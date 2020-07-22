import 'package:covidhelper_v2/pages/register_one_text.dart';
import 'package:flutter/material.dart';

class RegisterPhone extends StatefulWidget {
  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RegisterOneText(
      label: 'Telefon',
      welcomeTextBig: 'Numar de telefon',
      welcomeTextSmall: 'Indroduceti numarul de telefon',
          inputType: TextInputType.number,
    ));
  }
}

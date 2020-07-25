import 'package:covidhelper_v2/pages/register/register_one_text.dart';
import 'package:flutter/material.dart';


class RegisterPhone extends StatefulWidget {
  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  String phoneNumber;
  String errorText;

  @override
  Widget build(BuildContext context) {
    bool phoneOk = false;

    void changePhoneNumber(String val) {
      phoneNumber = val;
    }

    void verifyPhone() {
      if (phoneNumber == null) {
        errorText = 'Introduceti numarul de telefon!';
      } else if (phoneNumber.length != 10 || phoneNumber[0] != '0') {
        errorText = 'Numarul de telefon nu este valid';
      } else {
        errorText = null;
        phoneOk = true;
      }
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
        setState(() {
          verifyPhone();
          if (phoneOk == true) {
            Navigator.of(context)
                .pushNamed('/register_password', arguments: phoneNumber);
          }
        });
      },
      errorText: errorText,
    ));
  }
}

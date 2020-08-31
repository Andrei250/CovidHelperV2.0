import 'package:covidhelper_v2/pages/register/register_one_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPhone extends StatefulWidget {
  RegisterPhone({this.onButtonNextPressed, this.onButtonBackPressed, this.userValue});

  final VoidCallback onButtonBackPressed;
  final VoidCallback onButtonNextPressed;
  final String userValue;

  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  String phoneNumber;
  String errorText;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

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
      loading: _loading,
      onButtonNextPressed: () {
        setState(() {
          verifyPhone();
          if (phoneOk == true) {
            setState(() {
              _loading = true;
            });
            if (widget.userValue == 'vendor') {
              Navigator.of(context).pushNamed('/register_address', arguments: phoneNumber);
            } else {
              Navigator.of(context).pushNamed('/loading_screen', arguments: phoneNumber);
            }
            setState(() {
              _loading = false;
            });
          }
        });
      },
      onButtonBackPressed: () {
        setState(() {
          _loading = true;
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        });
        Navigator.of(context).pop();
        setState(() {
          _loading = false;
        });
      },
      errorText: errorText,
    ));
  }
}

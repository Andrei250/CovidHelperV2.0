import 'package:covidhelper_v2/pages/register/register_one_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  String email;
  String errorText;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    bool emailOk;

    void changeEmail(String val) {
      email = val;
    }

    void verifyEmail() {
      if (email == null) {
        errorText = 'Introduceti adresa de email!';
        emailOk = false;
      } else {
        bool isValid = EmailValidator.validate(email);
        if (isValid == false) {
          errorText = 'Introduceti o adresa de email valida!';
          emailOk = false;
        } else {
          errorText = null;
          emailOk = true;
        }
      }
    }

    return RegisterOneText(
      label: 'Email',
      welcomeTextBig: 'Indroduceti adresa de email',
      inputType: TextInputType.text,
      passwordText: false,
      route: '/register_email',
      changeValue: changeEmail,
      loading: _loading,
      onButtonNextPressed: () {
        setState(() {
          verifyEmail();
          if (emailOk == true) {
            setState(() {
              _loading = true;
            });
            Navigator.of(context)
                .pushNamed('/register_password', arguments: email);
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
    );
  }

}

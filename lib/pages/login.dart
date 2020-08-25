import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirestoreService _auth = FirestoreService();

  String password;
  String email;
  String error = '';
  String errorFirstText;
  String errorSecondText;

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    bool passwordOk = false;
    bool emailOk = false;
    bool valid = false;

    void changePassword(String val) {
      password = val;
    }

    void changeEmail(String val) {
      email = val;
    }

    void verifyEmail() {
      if (email == null) {
        setState(() {
          errorFirstText = 'Introduceti adresa de email!';
        });
      } else {
        setState(() {
          emailOk = true;
        });
      }
    }

    void verifyPassword() {
      if (password == null) {
        setState(() {
          errorSecondText = 'Introduceti parola!';
        });
      } else {
        setState(() {
          passwordOk = true;
        });
      }
    }

    void verifyBoth() {
      verifyEmail();
      verifyPassword();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        floatingActionButton: new RaisedButton(
          color: AppTheme.lightAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            'Inainte',
            style: eButton,
          ),
          onPressed: () async {
            setState(() {
              verifyBoth();
              if (passwordOk == true && emailOk == true) {
                valid = true;
              }
            });
            if (valid == true) {
              dynamic result = await _auth.login(email, password);
              if (result == null) {
                setState(() {
                  errorFirstText = 'Email-ul sau parola incorecta!';
                  errorSecondText = 'Email-ul sau parola incorecta!';
                });
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    result['route'], (route) => false,
                    arguments: result);
              }
            }
          },
        ),
        body: ListView(
            shrinkWrap: true,
            controller: _scrollController,
            reverse: true,
            children: <Widget>[
              Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 49.0,
                      ),
                      LogoRegister(),
                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        child: Text('Intra in cont', style: eTitle),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 320.0,
                        height: 105.0,
                        child: InputTextField(
                          label: 'Email',
                          passwordText: false,
                          inputType: TextInputType.text,
                          changeValue: changeEmail,
                          errorText: errorFirstText,
                          one: true,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                          width: 320.0,
                          height: 88.0,
                          child: InputTextField(
                            label: 'Parola',
                            passwordText: true,
                            inputType: TextInputType.text,
                            changeValue: changePassword,
                            errorText: errorSecondText,
                            one: false,
                          )),
                      SizedBox(
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
              ]),
            ]));
  }
}

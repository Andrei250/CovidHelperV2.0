import 'package:covidhelper_v2/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_register.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';


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
      if(email == null){
        errorFirstText  = 'Introduceti adresa dumneavoastra de email!';
      } else {
        emailOk = true;
      }
    }

    void verifyPassword() {
      if (password == null) {
        errorSecondText = 'Introduceti parola dumneavoastra!';
      } else {
        passwordOk = true;
      }
    }

    void verifyBoth(){
      verifyEmail();
      verifyPassword();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Scaffold(
        floatingActionButton:
        new RaisedButton(child: Text('Inainte'), onPressed: () async {
          setState(()  {
            verifyBoth();
            if(passwordOk == true && emailOk == true){
              valid = true;
            }
          });
          if(valid == true){
            dynamic result = await _auth.login(email, password);
            if(result == null){
              setState(() {
                error = 'Email-ul sau parola incorecta!';
              });
            }
             }
          },
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                      child: SizedBox(
                        height: 60.0,
                        width: 60.0,
                        child: LogoRegister(),
                      ),
                    ),
                    Text('Conecteaza-te',
                        style: AppTheme.darkTheme.textTheme.headline2),
                    SizedBox(
                      height: 40.0,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: 320.0,
                          height: 83.0,
                          child: InputTextField(
                            label: 'Email',
                            passwordText: false,
                            inputType: TextInputType.text,
                            changeValue: changeEmail,
                            errorText: errorFirstText,
                          ),
                        ),
                        SizedBox(
                            width: 320.0,
                            height: 83.0,
                            child: InputTextField(
                              label: 'Parola',
                              passwordText: true,
                              inputType: TextInputType.text,
                              changeValue: changePassword,
                              errorText: errorSecondText,
                            )),
                        SizedBox(height: 5.0,),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
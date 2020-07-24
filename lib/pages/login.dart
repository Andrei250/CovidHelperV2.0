import 'package:covidhelper_v2/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Scaffold(
        floatingActionButton:
        new RaisedButton(child: Text('Inainte')),
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
                          height: 50.0,
                          child: InputTextField(
                            label: 'Email',
                            passwordText: false,
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                            width: 320.0,
                            height: 50.0,
                            child: InputTextField(
                              label: 'Parola',
                              passwordText: true,
                              inputType: TextInputType.text,
                            ))
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

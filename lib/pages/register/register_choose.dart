import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_register.dart';
import 'package:flutter/material.dart';

class RegisterChoose extends StatefulWidget {
  RegisterChoose(
      {this.label,
        this.welcomeTextBig,
        this.welcomeTextSmall,
        this.passwordText,
        this.inputType,
        this.onPressed,
        this.route,
        this.changeValue,
        this.errorText});

  final String label;
  final String welcomeTextBig;
  final String welcomeTextSmall;
  final bool passwordText;
  final TextInputType inputType;
  final VoidCallback onPressed;
  final String route;
  final Function(String) changeValue;
  final String errorText;

  @override
  _RegisterChooseState createState() => _RegisterChooseState();
}

class _RegisterChooseState extends State<RegisterChoose> {
  String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void changeName(String val) {
      name = val;
    }

    return MaterialApp(
      onGenerateRoute: RegisterAll.generateRoute,
      theme: AppTheme.darkTheme,
      home: Scaffold(
        floatingActionButton: new RaisedButton(
          child: Text('Inainte'),
          onPressed: widget.onPressed,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                    width: 60.0,
                    child: LogoRegister(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    child: Text('${widget.welcomeTextBig}',
                        style: AppTheme.darkTheme.textTheme.headline2),
                  ),
                  SizedBox(
                    child: Text('${widget.welcomeTextSmall}',
                        style: AppTheme.darkTheme.textTheme.headline3),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

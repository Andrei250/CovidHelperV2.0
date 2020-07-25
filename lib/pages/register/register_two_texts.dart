import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_register.dart';
import 'package:flutter/material.dart';

class RegisterTwoTexts extends StatefulWidget {
  RegisterTwoTexts(
      {this.labelOne,
      this.labelTwo,
      this.welcomeTextBig,
      this.welcomeTextSmall,
      this.inputType,
      this.passwordText,
      this.onPressed,
      this.route,
      this.changeFirstValue,
      this.changeSecondValue,
      this.errorFirstText,
      this.errorSecondText});

  final String labelOne;
  final String labelTwo;
  final String welcomeTextBig;
  final String welcomeTextSmall;
  final TextInputType inputType;
  final bool passwordText;
  final VoidCallback onPressed;
  final String route;
  final Function(String) changeFirstValue;
  final Function(String) changeSecondValue;
  final String errorFirstText;
  final String errorSecondText;

  @override
  _RegisterTwoTextsState createState() => _RegisterTwoTextsState();
}

class _RegisterTwoTextsState extends State<RegisterTwoTexts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: RegisterAll.generateRoute,
        theme: AppTheme.darkTheme,
        home: Scaffold(
            floatingActionButton: new RaisedButton(
              child: Text('Inainte'),
              onPressed: widget.onPressed,
            ),
            body: ListView(
//              shrinkWrap: true,
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
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 320.0,
                        height: 110.0,
                        child: InputTextField(
                          label: '${widget.labelOne}',
                          passwordText: widget.passwordText,
                          inputType: widget.inputType,
                          changeValue: widget.changeFirstValue,
                          errorText: widget.errorFirstText,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                          width: 320.0,
                          height: 88.0,
                          child: InputTextField(
                            label: '${widget.labelTwo}',
                            passwordText: widget.passwordText,
                            inputType: widget.inputType,
                            changeValue: widget.changeSecondValue,
                            errorText: widget.errorSecondText,
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}

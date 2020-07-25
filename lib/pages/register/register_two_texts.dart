import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_register.dart';
import 'package:flutter/material.dart';

class RegisterTwoTexts extends StatefulWidget {
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
      this.changeSecondValue});

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
                    Text('${widget.welcomeTextBig}',
                        style: AppTheme.darkTheme.textTheme.headline2),
                    Text('${widget.welcomeTextSmall}',
                        style: AppTheme.darkTheme.textTheme.headline3),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: 320.0,
                          height: 50.0,
                          child: InputTextField(
                            label: '${widget.labelOne}',
                            passwordText: widget.passwordText,
                            inputType: widget.inputType,
                            changeValue: widget.changeFirstValue,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                            width: 320.0,
                            height: 50.0,
                            child: InputTextField(
                              label: '${widget.labelTwo}',
                              passwordText: widget.passwordText,
                              inputType: widget.inputType,
                              changeValue: widget.changeSecondValue,
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

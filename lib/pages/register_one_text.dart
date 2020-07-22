import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_register.dart';
import 'package:flutter/material.dart';

class RegisterOneText extends StatefulWidget {
  final String label;
  final String welcomeTextBig;
  final String welcomeTextSmall;
  final TextInputType inputType;

  RegisterOneText(
      {this.label, this.welcomeTextBig, this.welcomeTextSmall, this.inputType});

  @override
  _RegisterOneTextState createState() => _RegisterOneTextState();
}

class _RegisterOneTextState extends State<RegisterOneText> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Scaffold(
        floatingActionButton:
            new RaisedButton(onPressed: () {}, child: Text('Inainte')),
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
                      padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 20.0),
                      child: SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: LogoRegister(),
                      ),
                    ),
                    Text('${widget.welcomeTextBig}',
                        style: AppTheme.darkTheme.textTheme.headline2),
                    Text('${widget.welcomeTextSmall}',
                        style: AppTheme.darkTheme.textTheme.headline3),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                        width: 320.0,
                        height: 100.0,
                        child: InputTextField(
                            inputType: widget.inputType,
                            label: '${widget.label}')),
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

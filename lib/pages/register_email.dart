import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//const logo = 'assets/images/logos/logo_white.svg';

class RegisterEmail extends StatefulWidget {
  final String label;
  final String welcomeTextBig;
  final String welcomeTextSmall;
  final TextInputType inputType;

  RegisterEmail({this.label, this.welcomeTextBig, this.welcomeTextSmall, this.inputType});

  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(onOnFocusNodeEvent);
  }

  onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();
    super.dispose();
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
                        child: SvgPicture.asset(
                          logo_one,
                          color: AppTheme.lightColor,
                          height: 70.0,
                          width: 70.0,
                        ),
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
                      width: 320,
                      child: new TextFormField(
                        keyboardType: widget.inputType,
                        focusNode: focusNode,
                        style: AppTheme.darkTheme.textTheme.subtitle1,
                        cursorColor: AppTheme.lightColor,
                        decoration: new InputDecoration(
                          labelText: '${widget.label}',
                          labelStyle:
                              focusNode.hasFocus ? eLabelFocused : eLabel,
                        ),
                      ),
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

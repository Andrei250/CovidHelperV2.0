import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterOneText extends StatefulWidget {
  RegisterOneText(
      {this.label,
      this.welcomeTextBig,
      this.welcomeTextSmall,
      this.passwordText,
      this.inputType,
      this.onPressed,
      this.route,
      this.changeValue,
      this.errorText,
      this.onButtonPressed});

  final String label;
  final String welcomeTextBig;
  final String welcomeTextSmall;
  final bool passwordText;
  final TextInputType inputType;
  final VoidCallback onPressed;
  final String route;
  final Function(String) changeValue;
  final String errorText;
  final VoidCallback onButtonPressed;

  @override
  _RegisterOneTextState createState() => _RegisterOneTextState();
}

class _RegisterOneTextState extends State<RegisterOneText> {
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: widget.onButtonPressed,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SvgPicture.asset(
                  logo_one,
                  color: AppTheme.lightAccent,
                  height: 80.0,
                  width: 80.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  child: Text('${widget.welcomeTextBig}', style: eTitle),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                    width: 320.0,
                    height: 100.0,
                    child: InputTextField(
                      inputType: widget.inputType,
                      passwordText: widget.passwordText,
                      label: '${widget.label}',
                      changeValue: widget.changeValue,
                      errorText: widget.errorText,
                    )),
              ],
            ),
          )
        ],
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
        onPressed: widget.onPressed,
      ),
    );
  }
}

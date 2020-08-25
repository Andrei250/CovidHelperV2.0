import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      this.errorSecondText,
      this.onButtonNextPressed,
      this.onButtonBackPressed});

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
  final VoidCallback onButtonBackPressed;
  final VoidCallback onButtonNextPressed;

  @override
  _RegisterTwoTextsState createState() => _RegisterTwoTextsState();
}

class _RegisterTwoTextsState extends State<RegisterTwoTexts> {
  @override
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: widget.onButtonBackPressed,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
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
          onPressed: widget.onButtonNextPressed,
        ),
        body: ListView(
              shrinkWrap: true,
          controller: _scrollController,
          reverse: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 10.0),
              child: Column(
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
                    child: Text(widget.welcomeTextBig, style: eTitle),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 105.0,
                    child: InputTextField(
                      label: '${widget.labelOne}',
                      passwordText: widget.passwordText,
                      inputType: widget.inputType,
                      changeValue: widget.changeFirstValue,
                      errorText: widget.errorFirstText,
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
                        label: '${widget.labelTwo}',
                        passwordText: widget.passwordText,
                        inputType: widget.inputType,
                        changeValue: widget.changeSecondValue,
                        errorText: widget.errorSecondText,
                        one: false,
                      )),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

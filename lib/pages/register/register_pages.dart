import 'package:covidhelper_v2/pages/register/register_choose.dart';
import 'package:covidhelper_v2/pages/register/register_email.dart';
import 'package:covidhelper_v2/pages/register/register_name.dart';
import 'package:covidhelper_v2/pages/register/register_password.dart';
import 'package:covidhelper_v2/pages/register/register_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPages extends StatefulWidget {
//
//  Volunteer volunteer;
//
//
//  RegisterPages({ this.volunteer });

  @override
  _RegisterPagesState createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  int _currentIndex = 0;
  PageController _pageController;
  int data = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void hideKeyboard(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void onDataChange(int newData) {
    setState(() => data = newData);
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

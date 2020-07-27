import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_input.dart';

class ChangePassword extends StatefulWidget {
  final Map data;

  ChangePassword({this.data});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String password = '';
  String new_password = '';
  String repeat_new_password = '';
  String message;

  @override
  void initState() {
    super.initState();
    message = '';
  }

  void changePassword(String val) {
    password = val;
  }

  void changeRepeatPassword(String val) {
    repeat_new_password = val;
  }

  void changeNewPassword(String val) {
    new_password = val;
  }

  bool inputValidate() {
    message = '';
    if (password.length == 0 || repeat_new_password.length == 0 || new_password.length == 0) {
      message = 'All fields are required';
      return false;
    } else if (repeat_new_password != new_password || (new_password.length < 6)) {
      message = 'New password must have over 6 characters and must be the same';
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
        title: Text(
          'Change Password',
          style: AppTheme.darkTheme.textTheme.headline2,
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 0.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                    child: Text(
                      '${message}',
                      style: AppTheme.darkTheme.textTheme.subtitle2,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 100.0,
                    child: FormInput(
                      label: 'Password',
                      type: true,
                      changeValue: changePassword,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 100.0,
                    child: FormInput(
                      label: 'New Password',
                      type: true,
                      changeValue: changeNewPassword,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 100.0,
                    child: FormInput(
                      label: 'Repeat New Password',
                      type: true,
                      changeValue: changeRepeatPassword,
                    ),
                  ),
                  RaisedButton(
                    color: AppTheme.darkTheme.buttonColor,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () async {
                      if (!inputValidate()) {
                        setState(() {

                        });
                      } else {

                        dynamic result = await FirestoreService().changePassAdmin(widget.data['user'], widget.data['admin'], password, new_password);

                        if (result == null || result == 404) {
                          message = 'Error on changing information';
                          setState(() {

                          });
                        } else {
                          await widget.data['function']();
                          Navigator.pop(context);
                        }

                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

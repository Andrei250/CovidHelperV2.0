import 'package:covidhelper_v2/models/admin.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_input.dart';

class ChangeName extends StatefulWidget {
  final Map data;

  ChangeName({this.data});

  @override
  _ChangeNameState createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  String first_name;
  String last_name;
  String message;
  String emptyness_error;

  @override
  void initState() {
    super.initState();
    message = '';
    first_name = widget.data['admin'].first_name;
    last_name = widget.data['admin'].last_name;
  }

  void changeFirstName(String val) {
    first_name = val;
  }

  void changeLastName(String val) {
    last_name = val;
  }

  bool inputValidate() {
    message = '';
    if (last_name.isEmpty || first_name.isEmpty) {
      message = 'All fields are required';
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
          'Change name',
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
                      label: 'First Name',
                      type: false,
                      value: first_name,
                      changeValue: changeFirstName,
                    ),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 100.0,
                    child: FormInput(
                      label: 'Last Name',
                      type: false,
                      value: last_name,
                      changeValue: changeLastName,
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
                        Admin newAdmin = new Admin(first_name: first_name, last_name: last_name, email: widget.data['admin'].email);

                        dynamic result = await FirestoreService().changeNameAdmin(widget.data['user'].uid, newAdmin);

                        if (result == null) {
                          message = 'Error on changing information';
                          setState(() {

                          });
                        } else {
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

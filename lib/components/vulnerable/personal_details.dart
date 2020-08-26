import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  final Map data;

  PersonalDetails({this.data});

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
        title: Text(
          'Detalii Personale',
          style: AppTheme.darkTheme.textTheme.headline2,
        ),
      ),
      body: Column(

      ),
    );
  }
}

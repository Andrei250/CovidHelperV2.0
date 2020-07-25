import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RegisterAll.generateRoute,
        home:Center(
      child: (Text('home')),
    ));
  }
}

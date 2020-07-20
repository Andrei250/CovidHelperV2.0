import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.darkTheme,
        home: Scaffold(
          appBar: AppBar(
//            bottom: PreferredSize(
//              child: Container(
//                color: AppTheme.lightColor,
//                height: 0.5,
//              ),
//            ),
            leading: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.menu),
            ),
          ),
        ));
  }
}

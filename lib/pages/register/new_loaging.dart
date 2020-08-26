import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewLoading extends StatefulWidget {
  @override
  _NewLoadingState createState() => _NewLoadingState();
}

class _NewLoadingState extends State<NewLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitChasingDots(
          color: AppTheme.lightAccent,
        ),
      ),
    );
  }
}

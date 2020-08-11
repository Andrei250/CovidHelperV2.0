import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class StatisticsSquare extends StatefulWidget {
  StatisticsSquare({this.description});

  final String description;

  @override
  _StatisticsSquareState createState() => _StatisticsSquareState();
}

class _StatisticsSquareState extends State<StatisticsSquare> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppTheme.lightAccent,
//        gradient: LinearGradient(
//          begin: Alignment.topCenter,
//          end: Alignment.bottomCenter,
//          colors: [AppTheme.lightGradient, AppTheme.lightAccent],
//        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
            child: Text(
              widget.description,
              style: eStatsText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 8.0),
            child: Text(
              '500 km',
              style: eStatsTextValue,
            ),
          )
        ],
      ),
    );
  }
}

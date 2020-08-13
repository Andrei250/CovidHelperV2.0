import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonCardVolunteer extends StatefulWidget {
  PersonCardVolunteer({this.name});

  final String name;

  @override
  _PersonCardVolunteerState createState() => _PersonCardVolunteerState();
}

class _PersonCardVolunteerState extends State<PersonCardVolunteer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
                child: Icon(
                  Icons.person_outline,
                  color: AppTheme.lightAccent,
                  size: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: eTitle,
                    ),
                    Text(
                      'Se afla la 3km de tine',
                      style: eWelcome,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 15.0, 8.0),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.grey[600],
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

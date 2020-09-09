import 'package:covidhelper_v2/pages/volunteer/vulnerable_people_volunteer/volunteer_vulnerables.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class PeoplePageVolunteer extends StatefulWidget {
  PeoplePageVolunteer(
      {this.limit,
      this.number,
      this.customHeight,
      this.latitude,
      this.longitude});

  bool limit;
  int number;
  double customHeight;
  String latitude;
  String longitude;

  @override
  _PeoplePageVolunteerState createState() => _PeoplePageVolunteerState();
}

class _PeoplePageVolunteerState extends State<PeoplePageVolunteer> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
            child: Center(
                child: Text(
              'Aceste persoane au\nnevoin de ajutorul tau!',
              style: eTitle,
            )),
          ),
          SizedBox(
            height: 20,
          ),
          VolunteerVulnerables(
            limit: widget.limit,
            number: widget.number,
            customHeight: deviceHeight * 0.85,
            longitude: widget.longitude,
            latitude: widget.latitude,
          ),
        ],
      ),
    );
  }
}

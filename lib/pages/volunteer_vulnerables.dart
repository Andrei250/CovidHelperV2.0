import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/pages/volunteer_vulnearbles_card.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VolunteerVulnerables extends StatefulWidget {
  VolunteerVulnerables({this.limit, this.number});

  bool limit;
  int number;

  @override
  _VolunteerVulnerablesState createState() => _VolunteerVulnerablesState();
}

class _VolunteerVulnerablesState extends State<VolunteerVulnerables> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      height: deviceHeight,
      width: deviceWidth,
      child: StreamProvider<List<VulnerablePerson>>.value(
          value: FirestoreService().vulnerables,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: VolunteerVulnerablesCards(
              limit: widget.limit,
              number: widget.number,
            )),
          )),
    );
  }
}

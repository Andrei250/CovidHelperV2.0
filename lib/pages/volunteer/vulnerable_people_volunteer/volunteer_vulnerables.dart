import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/pages/volunteer/vulnerable_people_volunteer/volunteer_vulnearbles_card.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VolunteerVulnerables extends StatefulWidget {
  VolunteerVulnerables({this.limit, this.number, this.customHeight});

  bool limit;
  int number;
  double customHeight;

  @override
  _VolunteerVulnerablesState createState() => _VolunteerVulnerablesState();
}

class _VolunteerVulnerablesState extends State<VolunteerVulnerables> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.customHeight,
          child: StreamProvider<List<Orders>>.value(
          value: FirestoreService().orders,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: VolunteerVulnerablesCards(
              limit: widget.limit,
              number: widget.number,
            ),
          )),
    );
  }
}

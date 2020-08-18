import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/volunteer/vulnerable_people_volunteer/volunteer_vulnearbles_card.dart';
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
//      width: deviceWidth,
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

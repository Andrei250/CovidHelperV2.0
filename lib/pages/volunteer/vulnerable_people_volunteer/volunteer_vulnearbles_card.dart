import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_volunteer/person_card_volunteer.dart';

class VolunteerVulnerablesCards extends StatefulWidget {
  VolunteerVulnerablesCards({this.limit, this.number});

  bool limit;
  int number;

  @override
  _VolunteerVulnerablesCardsState createState() =>
      _VolunteerVulnerablesCardsState();
}

class _VolunteerVulnerablesCardsState extends State<VolunteerVulnerablesCards> {
  final FirestoreService _db = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final vulnerables = Provider.of<List<VulnerablePerson>>(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: vulnerables != null
              ? widget.limit == true ? widget.number : vulnerables.length
              : 0,
//          itemCount: vulnerables != null ? vulnerables.length : 0,
          itemBuilder: (context, index) {
            return PersonCardVolunteer(vulnerablePerson: vulnerables[index]);
          },
        )
      ],
    );
  }
}

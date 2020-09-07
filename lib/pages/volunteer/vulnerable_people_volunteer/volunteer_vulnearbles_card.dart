import 'package:covidhelper_v2/models/orders.dart';
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

  int itemCount(int length) {
    if (widget.limit == true) {
      if (widget.number > length) {
        return length;
      } else {
        return widget.number;
      }
    } else if (widget.limit == false) {
      return length;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Orders>>(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: orders != null ? itemCount(orders.length) : 0,
          // itemCount: orders != null ? orders.length : 0,
          itemBuilder: (context, index) {
            return PersonCardVolunteer(orders: orders[index]);
          },
        )
      ],
    );
  }
}

import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final VulnerablePerson vulnerable;

  PersonCard({this.vulnerable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
          ),
          title: Text(vulnerable.first_name.toString() + vulnerable.last_name.toString()),
          subtitle: Text(vulnerable.email),
        )
      ),
    );
  }
}

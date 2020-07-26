import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/components/person_card.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:provider/provider.dart';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  final FirestoreService _db = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final vulnerables = Provider.of<List<VulnerablePerson>>(context);
    final vendors = Provider.of<List<VulnerablePerson>>(context);

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Center(
            child: Text(
              'Vulnerables',
              style: AppTheme.darkTheme.textTheme.headline2,
            ),
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount:  vulnerables != null ? vulnerables.length : 0,
          itemBuilder: (context, index) {
            return PersonCard(vulnerable: vulnerables[index]);
          },
        ),
        Divider(
          height: 10.0,
          color: Colors.grey[400],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Center(
            child: Text(
              'Vendors',
              style: AppTheme.darkTheme.textTheme.headline2,
            ),
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount:  vendors != null ? vendors.length : 0,
          itemBuilder: (context, index) {
            return PersonCard(vulnerable: vendors[index]);
          },
        ),
      ],
    );
  }
}

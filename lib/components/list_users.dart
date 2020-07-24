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

    return ListView.builder(
        itemCount:  vulnerables != null ? vulnerables.length : 0,
        itemBuilder: (context, index) {
          return PersonCard(vulnerable: vulnerables[index]);
        },
    );
  }
}

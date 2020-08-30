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

    final vulnerables_widgets = List.generate(vulnerables.length, (index) {
        return PersonCard(vulnerable: vulnerables[index]);
    });

    final vendors_widgets = List.generate(vendors.length, (index) => PersonCard(vulnerable : vendors[index]));

    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Center(
            child: Text(
              'Persoane Vulnerabile',
              style: eWelcomeName,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: vulnerables_widgets,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0, 16.0),
          child: Divider(
            height: 10.0,
            color: Colors.grey[400],
          ),
        ),
        Center(
          child: Text(
            'Vanzatori',
            style: eWelcomeName
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: vendors_widgets,
        ),
      ],
    );
  }
}

import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
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
        color: AppTheme.primaryColor,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 29,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.black,
            ),
          ),
          title: Text(
              vulnerable.first_name.toString() + vulnerable.last_name.toString(),
              style: AppTheme.darkTheme.textTheme.headline3,
          ),
          subtitle: Text(
            vulnerable.email,
            style: AppTheme.darkTheme.textTheme.subtitle1,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/admin_panel/user/update_details', arguments: {'person': vulnerable});
          },
        )
      ),
    );
  }
}

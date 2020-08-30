import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonCard extends StatelessWidget {
  final VulnerablePerson vulnerable;

  PersonCard({this.vulnerable});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: SvgPicture.asset(
                user,
                height: 30.0,
                width: 30.0,
              ),
              title: Text(
                vulnerable.first_name.toString() +
                    vulnerable.last_name.toString(),
                style: eTitle,
              ),
              subtitle: Text(
                vulnerable.phone,
                style: eWelcome,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                    '/admin_panel/user/update_details',
                    arguments: {'person': vulnerable});
              },
            )));
  }
}

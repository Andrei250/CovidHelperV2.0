import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ButtonSettings extends StatelessWidget {
  final String label;
  final Icon icon;
  final String route;
  final Map arguments;
  final bool color;

  ButtonSettings({this.label, this.icon, this.route, this.arguments, this.color});

  void singOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ListTile(
              leading: icon,
              title: Text(
                  '${label}',
                  style: color == null && color == true ? AppTheme.darkTheme.textTheme.headline3 : AppTheme.lightTheme.textTheme.subtitle1,
              ),
              onTap: () {

                if (arguments['log-out'] == true) {
                  singOut(arguments['context']);
                } else {
                  if (arguments['context'] != null) {
                    Navigator.pushNamed(arguments['context'], route, arguments: arguments);
                  } else {
                    Navigator.pushNamed(context, route, arguments: arguments);
                  }

                }

              },
            ),
          ),
        ),
      ],
    );
  }
}

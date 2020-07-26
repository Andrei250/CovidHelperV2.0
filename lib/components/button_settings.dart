import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ButtonSettings extends StatelessWidget {
  final String label;
  final Icon icon;
  final String route;
  final Map arguments;

  ButtonSettings({this.label, this.icon, this.route, this.arguments});

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
                  style: AppTheme.darkTheme.textTheme.headline3,
              ),
              onTap: () {
                Navigator.pushNamed(context, route, arguments: arguments);
              },
            ),
          ),
        ),
      ],
    );
  }
}

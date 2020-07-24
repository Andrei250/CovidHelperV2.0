import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MoreMenuAdmin extends StatefulWidget {
  @override
  _MoreMenuAdminState createState() => _MoreMenuAdminState();
}
class _MoreMenuAdminState extends State<MoreMenuAdmin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              'Menu',
              style: AppTheme.darkTheme.textTheme.headline2,
            ),
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius:30,
                      child: Icon(Icons.person),
                    ),
                  ],
                ),
                Divider(
                  height: 30.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
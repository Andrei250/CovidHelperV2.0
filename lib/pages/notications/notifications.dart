import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notificari',
                    style: eTitle,
                  ),
                  new GestureDetector(
                    onTap: () {
                    },
                    child: new Text("Filtre", style: eWelcome,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ));
  }
}

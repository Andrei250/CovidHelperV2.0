import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpPersonCard extends StatefulWidget {
  @override
  _HelpPersonCardState createState() => _HelpPersonCardState();
}

class _HelpPersonCardState extends State<HelpPersonCard> {
  @override
  Widget build(BuildContext context) {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
                  child: Icon(
                    Icons.healing,
                    color: AppTheme.lightAccent,
                    size: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Apasa in caz de nevoie",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: eTitle,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {},
                    color: AppTheme.lightAccent,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(50.0, 2.0, 50.0, 2.0),
                      child: Text(
                        'AJUTOR',
                        style: eAcceptButton,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}

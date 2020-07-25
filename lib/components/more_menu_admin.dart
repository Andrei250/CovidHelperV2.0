import 'package:covidhelper_v2/components/button_settings.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                Card(
                    color: Color.fromRGBO(13, 10, 11, 1),
                    child: Column(
                      children: <Widget>[
                        ListTile(
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
                              'Heart Shaker',
                              style: TextStyle(
                                  fontFamily: 'quicksand',
                                  color: Colors.white,
                                  fontSize: 16.0
                              ),
                            ),
                          subtitle: Text(
                            'TWICE',
                            style: TextStyle(
                                fontFamily: 'quicksand',
                                color: Colors.white,
                                fontSize: 12.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(
                  height: 10.0,
                  color: Colors.grey[400],
                ),

                ButtonSettings(
                  label: 'Change name',
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                ButtonSettings(
                  label: 'Change password',
                  icon: Icon(
                    Icons.security,
                    color: Colors.white,
                  ),
                ),
                ButtonSettings(
                  label: 'See reports',
                  icon: Icon(
                    Icons.report,
                    color: Colors.white,
                  ),
                ),
                ButtonSettings(
                  label: 'Log out',
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:covidhelper_v2/components/button_settings.dart';
import 'package:covidhelper_v2/models/admin.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreMenuAdmin extends StatefulWidget {
  final FirebaseUser user;
  final Admin admin;
  final Function function;
  final BuildContext context;

  MoreMenuAdmin({this.user, this.admin, this.function, this.context});

  @override
  _MoreMenuAdminState createState() => _MoreMenuAdminState();
}

class _MoreMenuAdminState extends State<MoreMenuAdmin> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SafeArea(
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
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset(
                              user,
                              height: 40,
                              width: 40,
                            ),
                            title: Text(
                              '${widget.admin.first_name} ${widget.admin.last_name}',
                              style: eTitle
                            ),
                            subtitle: Text(
                              '${widget.admin.email}',
                              style: eWelcome,
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
                      route: '/admin_panel/change_name',
                      arguments: {
                        'user': widget.user,
                        'admin': widget.admin,
                        'function': widget.function,
                      },
                    ),
                    ButtonSettings(
                      label: 'Change password',
                      icon: Icon(
                        Icons.security,
                        color: Colors.white,
                      ),
                      route: '/admin_panel/change_password',
                      arguments: {
                        'user': widget.user,
                        'admin': widget.admin,
                        'function': widget.function,
                      },
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
                      arguments: {
                        'log-out': true,
                        'context': widget.context,
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

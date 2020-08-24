import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_settings.dart';

class LeftNavigation extends StatefulWidget {
  Size size;
  VulnerablePerson person;
  Map data;
  final BuildContext context;

  LeftNavigation({this.size, this.person, this.data, this.context});

  @override
  _LeftNavigationState createState() => _LeftNavigationState();
}

class _LeftNavigationState extends State<LeftNavigation> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Drawer(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.asset('assets/images/background.png'),
                    Positioned(
                      left: orientation == Orientation.portrait ? widget.size.width * 0.07 : widget.size.width * 0.03,
                      top: orientation == Orientation.portrait ? widget.size.width * 0.17 : widget.size.width * 0.1,
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.primaryColor,
//                        image:,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.person.first_name + ' ' +widget.person.last_name ,
                                  style: AppTheme.darkTheme.textTheme.headline3,
                                ),
                                Text(
                                  widget.person.phone,
                                  style: AppTheme.darkTheme.textTheme.headline4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              getNavigations(orientation, widget.size, widget.context, widget.data),
            ],
          ),
        );
      },
    );
  }
}


Widget getNavigations(Orientation orientation, Size size, BuildContext context, Map data) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: orientation == Orientation.portrait ? size.width * 0.05 : size.width * 0.02,
            horizontal: orientation == Orientation.portrait ? size.width * 0.03 : size.width * 0.07,
        ),
        child: Column(
          children: [
            ButtonSettings(
              label: 'Setari',
              color: true,
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              route: '/settings',
              arguments: {
                'userInfo' : data,
                'context' : context,
              },
            ),
            ButtonSettings(
              label: 'Detalii Personale',
              color: true,
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              route: '/',
              arguments: {
                'user' : "DA",
              },
            ),
            ButtonSettings(
              label: 'Feedback',
              color: true,
              icon: Icon(
                Icons.feedback,
                color: Colors.black,
              ),
              route: '/feedback',
              arguments: {
                'userInfo' : data,
                'context' : context,
              },
            ),
            ButtonSettings(
              label: 'Deconecteaza-te',
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              arguments: {
                'log-out' : true,
                'context' : context,
              },
            ),
          ],
        ),
      ),
    ],
  );
}
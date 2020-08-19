import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_settings.dart';

class LeftNavigation extends StatefulWidget {
  final Size size;

  LeftNavigation({this.size});

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
                      left: widget.size.width * 0.07,
                      top: widget.size.width * 0.07,
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
                                  "Numele si Prenumele",
                                  style: AppTheme.darkTheme.textTheme.subtitle1,
                                ),
                                Text(
                                  "Numarul de telefon sau Email",
                                  style: AppTheme.darkTheme.textTheme.subtitle2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: widget.size.width * 0.07,
                      bottom: orientation == Orientation.portrait ? widget.size.width * 0.20 : widget.size.width * 0.10,
                      child: Row(
                        children: [
                          Text(
                            "Email",
                            style: AppTheme.darkTheme.textTheme.headline3,
                          ),

                          IconButton(
                            icon: Icon(Icons.arrow_circle_down),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              getNavigations(orientation, widget.size),
            ],
          ),
        );
      },
    );
  }
}


Widget getNavigations(Orientation orientation, Size size) {
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
              route: '/',
              arguments: {
                'user' : "DA",
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
              route: '/',
              arguments: {
                'user' : "DA",
              },
            ),
            ButtonSettings(
              label: 'Log out',
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
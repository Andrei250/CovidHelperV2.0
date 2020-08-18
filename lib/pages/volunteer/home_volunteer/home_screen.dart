import 'package:covidhelper_v2/pages/volunteer/home_volunteer/fav_person_card.dart';
import 'package:covidhelper_v2/pages/volunteer_vulnerables.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
//  HomeScreen({this.name});
//
//  final String name;

  final VoidCallback onButtonPressed;

  HomeScreen({@required this.onButtonPressed});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String getInitials(String name) {
      name = name.trim();
      String initials = name[0];
      int i = 0;
      for (int i = 1; i < name.length; i++) {
        if (name[i - 1] == ' ' && name[i] != ' ') {
          initials += name[i];
        }
      }
      return initials.toUpperCase();
    }

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
//        theme: AppTheme.darkTheme,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                //  TODO change the color of the app bar ? or not
//                backgroundColor: Color.fromRGBO(0, 200, 150, 1),
                backgroundColor: Colors.white,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
//                    Container(height: 30, width: 30, child: LogoAppBar()),
                    Text(
                      'Covidhelper',
                      style: eTitle,
                    ),
                    Container(
                      width: 40.0,
                      height: 40.0,
                      child: Center(
                          child: Text(
                        's',
//                          child: Text(getInitials(widget.name),
                        style: eStreet,
                      )),
                      decoration: new BoxDecoration(
                        color: AppTheme.lightAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 0.0),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Salut!',
                            style: eWelcome,
                          ),
                          Text(
//                            widget.name,
                            'a',
                            style: eWelcomeName,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                          child: Container(
                            width: double.maxFinite,
                            height: 80.0,
                            color: AppTheme.lightAccent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 15.0, 10.0, 5.0),
                                  child: Text(
                                    'Persoana se afla la 15km de tine',
                                    style: eGrey,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 0.0, 10.0, 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 30.0,
                                          width: 30.0,
                                          child: SvgPicture.asset(
                                            distance,
                                            color: AppTheme.lightColor,
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Strada Luncilor, Nr 7',
                                          style: eStreet,
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(25.0)),
                          child: Container(
                            width: double.maxFinite,
                            height: 130.0,
                            color: Colors.grey[200],
                            child: FavPersonCard(name: 'Vlad Udrescu'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Ajuta alte persoane',
                          style: eWelcome,
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          onPressed: widget.onButtonPressed,
                          child: Text(
                            'Vezi toate',
                            style: eSeeAll,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child:
                          ListView(scrollDirection: Axis.vertical, children: [
                    VolunteerVulnerables(
                      limit: true,
                      number: 5,
                      customHeight: deviceHeight * 0.45,
                    ),
                  ])),
                ])));
  }
}

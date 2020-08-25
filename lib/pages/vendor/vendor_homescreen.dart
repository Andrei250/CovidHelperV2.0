import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_coming_volunteer.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_produtcs.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorHomeScreen extends StatefulWidget {
//
//  Volunteer volunteer;
//
//
//  VendorHomeScreen({ this.volunteer });

  final VoidCallback onButtonPressed;

  VendorHomeScreen({@required this.onButtonPressed});

  @override
  _VendorHomeScreenState createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  final VendorBack vend = VendorBack();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                    SvgPicture.asset(
                      drawer,
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
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
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
                        height: 90.0,
                        color: AppTheme.lightAccent,
                        child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: SvgPicture.asset(
                                        clock,
                                        height: 25.0,
                                        width: 25.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Text(
                                        'Voluntarul va ajunge in XXX minute',
                                        style: eProducts,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: SvgPicture.asset(
                                        pack,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'Trebuie sa pregatesti 15 produse',
                                        style: eProducts,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(25.0)),
                      child: Container(
                        width: double.maxFinite,
                        height: 130.0,
                        color: Colors.grey[200],
                        child: VendorComingVolunteer(name: 'Vlad Udrescu'),
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
                      'Urmeaza sa se termine',
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
                  child: ListView(scrollDirection: Axis.vertical, children: [
                VendorProducts(
                  limit: true,
                  number: 5,
                  customHeight: deviceHeight * 0.4,
                ),
              ])),
            ])));
  }
}

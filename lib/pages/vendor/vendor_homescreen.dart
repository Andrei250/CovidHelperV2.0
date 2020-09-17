import 'package:covidhelper_v2/components/left_nav.dart';
import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_coming_volunteer.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_orders.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_processing_orders.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_produtcs.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class VendorHomeScreen extends StatefulWidget {
//
//  Volunteer volunteer;
//
//
//  VendorHomeScreen({ this.volunteer });

  final VoidCallback onSeeAllButtonPressed;
  final VoidCallback onAddButtonPressed;
  final Map data;

  VendorHomeScreen(
      {@required this.onSeeAllButtonPressed, this.onAddButtonPressed, this.data});

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
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(debugLabel: '_VendorHomeScreen');

    return Scaffold(
            key: _scaffoldKey,
            drawer: LeftNavigation(size: size, data: widget.data, context: context),
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                //  TODO change the color of the app bar ? or not
//                backgroundColor: Color.fromRGBO(0, 200, 150, 1),
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: SvgPicture.asset(
                    drawer,
                    color: Colors.black,
                  ),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
              Expanded(
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    VendorOrders(
                      limit: true,
                      number: 3,
                      customHeight: deviceHeight * 0.4,
                    ),
                  ])),
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
                      onPressed: widget.onSeeAllButtonPressed,
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
                            onAddButtonPressed: widget.onAddButtonPressed,
                          ),
                  ])),
            ])
    );
  }
}

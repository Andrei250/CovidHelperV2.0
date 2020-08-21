import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_all_products.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_homescreen.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class VendorHome extends StatefulWidget {
//
//  Volunteer volunteer;
//
//
//  VendorHome({ this.volunteer });

  @override
  _VendorHomeState createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {
  int _currentIndex = 0;
  PageController _pageController;

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
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: AppTheme.lightColor,
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 25,
          curve: Curves.easeInBack,
          onItemSelected: (index) {
            setState(
              () {
                _currentIndex = index;
                _pageController.jumpToPage(index);
              },
            );
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home', style: eNavBarText),
              activeColor: AppTheme.lightAccent,
              inactiveColor: AppTheme.lightAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.insert_chart),
              title: Text('asf', style: eNavBarText),
              activeColor: AppTheme.lightAccent,
              inactiveColor: AppTheme.lightAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Home', style: eNavBarText),
              activeColor: AppTheme.lightAccent,
              inactiveColor: AppTheme.lightAccent,
              textAlign: TextAlign.center,
            )
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            VendorHomeScreen(onButtonPressed: () {
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            }),
            VendorAllProducts(limit: false),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

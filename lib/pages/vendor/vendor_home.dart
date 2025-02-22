import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_all_products.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_homescreen.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_stock/vendor_addproducts.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorHome extends StatefulWidget {
//
//  Volunteer volunteer;
//
//
//  VendorHome({ this.volunteer });

  final Map data;
  VendorHome({ this.data });

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
    return Scaffold(
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
              icon: SvgPicture.asset(
                home,
                height: 30,
                width: 30,
                color: AppTheme.lightAccent,
              ),
              title: Text('Acasa', style: eNavBarText),
              activeColor: AppTheme.lightAccent,
              inactiveColor: AppTheme.lightAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset(
                list,
                height: 30,
                width: 30,
                color: AppTheme.lightAccent,
              ),
              title: Text('Produse', style: eNavBarText),
              activeColor: AppTheme.lightAccent,
              inactiveColor: AppTheme.lightAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset(
                box,
                height: 30,
                width: 30,
                color: AppTheme.lightAccent,
              ),
              title: Text('Stoc', style: eNavBarText),
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

            VendorHomeScreen(onSeeAllButtonPressed: () {
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            }, onAddButtonPressed: () {
              _pageController.animateToPage(2,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
              data : widget.data,
            ),
            VendorAllProducts(limit: false),
            VendorAddProducts(),
            // Container(color: Colors.white,)
          ],
        ),
      );
  }
}

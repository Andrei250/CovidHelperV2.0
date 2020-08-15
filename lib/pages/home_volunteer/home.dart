import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/pages/people_page_volunteer.dart';
import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/home_volunteer/home_screen.dart';

class Home extends StatefulWidget {
//  Volunteer volunteer;
//
//  Home({ this.volunteer });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      onGenerateRoute: RegisterAll.generateRoute,
      color: Colors.white,
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
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
              icon: Icon(Icons.person),
              title: Text(
                'Persoane',
                style: eNavBarText,
              ),
              activeColor: AppTheme.lightAccent,
              inactiveColor: AppTheme.lightAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home', style: eNavBarText),
              activeColor: AppTheme.lightAccent,
              inactiveColor: AppTheme.lightAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text('home', style: eNavBarText),
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
//                HomeScreen(name: widget.volunteer.name),
            HomeScreen(onButtonPressed: () {
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            }),
            PeoplePageVolunteer(limit: false),
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/pages/register/register_email.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
//
//  Volunteer volunteer;
//
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
        home: Scaffold(
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: AppTheme.primaryColor,
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 8,
            curve: Curves.easeInBack,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.jumpToPage(index);
              },);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('home'),
                activeColor: Colors.purpleAccent,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.insert_chart),
                title: Text('home'),
                activeColor: Colors.purpleAccent,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.notifications),
                title: Text('home'),
                activeColor: Colors.purpleAccent,
                textAlign: TextAlign.center,
              )
            ],
          ),
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                RegisterEmail(),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ));
  }
}

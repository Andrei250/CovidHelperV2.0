import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/pages/volunteer/current_order/current_order.dart';
import 'package:covidhelper_v2/pages/volunteer/home_volunteer/home_screen.dart';
import 'package:covidhelper_v2/pages/volunteer/statistics_volunteer/statistics.dart';
import 'package:covidhelper_v2/pages/volunteer/vulnerable_people_volunteer/people_page_volunteer.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
//  Volunteer volunteer;
//
//  Home({ this.volunteer });

  final Map data;

  Home({this.data});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  PageController _pageController;
  String _latitude;
  String _longitude;

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(position);

    setState(() {
      _latitude = "${position.latitude}";
      _longitude = "${position.longitude}";
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: SvgPicture.asset(
              home,
              height: 30,
              width: 30,
              color: AppTheme.lightAccent,
            ),
            title: Text('Home', style: eNavBarText),
            activeColor: AppTheme.lightAccent,
            inactiveColor: AppTheme.lightAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset(
              people,
              height: 30,
              width: 30,
              color: AppTheme.lightAccent,
            ),
            title: Text(
              'Persoane',
              style: eNavBarText,
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset(
                box,
                height: 30,
                width: 30,
                color: AppTheme.lightAccent,
              ),
              title: Text('In Curs', style: eNavBarText),
              activeColor: AppTheme.lightAccent,
              inactiveColor: AppTheme.lightAccent,
              textAlign: TextAlign.center,
            ),
            //     BottomNavyBarItem(
            //       icon: Icon(Icons.notifications),
            //       title: Text('home', style: eNavBarText),
            //       activeColor: AppTheme.lightAccent,
            //       inactiveColor: AppTheme.lightAccent,
            //       textAlign: TextAlign.center,
            //     )
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
//                HomeScreen(name: widget.volunteer.name),
          HomeScreen(
            onButtonPressed: () {
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            data: widget.data,
            latitude: _latitude,
            longitude: _longitude,
          ),
          PeoplePageVolunteer(
            limit: false,
            latitude: _latitude,
            longitude: _longitude,
          ),
          StatisticsVolunteer(),
          // Container(
          //   color: Colors.red,                     // notifications
          // ),
        ],
      ),
    );
  }
}

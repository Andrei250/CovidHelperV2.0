import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/components/list_users.dart';
import 'package:covidhelper_v2/components/more_menu_admin.dart';
import 'package:covidhelper_v2/components/register_user.dart';
import 'package:covidhelper_v2/models/admin.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AdminPanel extends StatefulWidget {
  final Map data;

  AdminPanel({this.data});

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  static FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  Admin admin;

  void _getUser() async {
    user = await _auth.currentUser();
    admin = await FirestoreService().getAdmin(user);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void change() async {
    admin = await FirestoreService().getAdmin(user);
    setState(() {});
  }

  Widget _getFragment(int index, BuildContext context) {
    if (index == 0) {
      return MoreMenuAdmin(
        user: user,
        admin: admin,
        function: change,
        context: context,
      );
    } else if (index == 2) {
      return RegisterUser();
    }
    return ListUsers();
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    _pageController = PageController();
  }

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<VulnerablePerson>>.value(
        value: FirestoreService().vulnerables,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
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
              ]),
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              MoreMenuAdmin(
                user: user,
                admin: admin,
                function: change,
                context: context,
              ),
              RegisterUser(),
              ListUsers(),
            ],
          ),
        ));
    //       items: const <BottomNavigationBarItem>[
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.dehaze),
    //           title: Text('More'),
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.featured_play_list),
    //           title: Text('Users'),
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.add),
    //           title: Text('Add Person'),
    //         ),
    //       ],
    //       currentIndex: _selectedIndex,
    //       backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
    //       unselectedItemColor: Colors.grey[700],
    //       selectedItemColor: Colors.white,
    //       onTap: _onItemTapped,
    //     ),
    //   ),
    // );
  }
}

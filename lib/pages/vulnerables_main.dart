import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/components/left_nav.dart';
import 'package:covidhelper_v2/components/vulnerable/need_help.dart';
import 'package:covidhelper_v2/components/vulnerable/report.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/pages/register/register_email.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class VulnerablesMain extends StatefulWidget {
  final Map data;

  VulnerablesMain({this.data});
  @override
  _VulnerablesMain createState() => _VulnerablesMain();
}

class _VulnerablesMain extends State<VulnerablesMain> {
  int _currentIndex = 0;
  PageController _pageController;

  Widget getPage() {
    if (_currentIndex == 0) {
      return NeedHelp();
    } else if (_currentIndex == 1) {
      return Container(
        color: Colors.amber,
      );
    } else if (_currentIndex == 2) {
      return Report();
    }

  }

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

  AppBar interfaceAppBar(GlobalKey<ScaffoldState> _scaffoldKey) {
    return AppBar(
      elevation:0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            color: Colors.black,
        ),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;

    return StreamProvider<List<Vendor>>.value(
      value: FirestoreService().vendors,
      child: MaterialApp(
          home: Scaffold(
            key: _scaffoldKey,
            appBar: interfaceAppBar(_scaffoldKey),
            drawer: LeftNavigation(size: size, person: VulnerablePerson().fromStream(widget.data['userInfo']), data: widget.data, context: context),
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: Colors.grey[100],
              selectedIndex: _currentIndex,
              showElevation: true,
              itemCornerRadius: 32,
              curve: Curves.easeInBack,
              onItemSelected: (index) {
                setState(() {
                  _currentIndex = index;
                  setState(() {

                  });
                },);
              },
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Icon(Icons.help),
                  title: Text('Ajutor',
                      style: TextStyle(
                          fontFamily: 'quicksand',
                          color: AppTheme.lightAccent,
                          fontSize: 15.0)
                      ),
                  activeColor: AppTheme.lightAccent,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text('Notificari',
                      style: TextStyle(
                          fontFamily: 'quicksand',
                          color: AppTheme.lightAccent,
                          fontSize: 15.0)
                      ),
                  activeColor: AppTheme.lightAccent,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.report),
                  title: Text('Raport',
                      style: TextStyle(
                          fontFamily: 'quicksand',
                          color: AppTheme.lightAccent,
                          fontSize: 15.0)
                    ),
                  activeColor: AppTheme.lightAccent,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            body: SizedBox.expand(
              child: PageView(
//                controller: _pageController,
//                onPageChanged: (index) {
//                  setState(() => _currentIndex = index);
//                },
                children: <Widget>[
                  getPage(),
                ],
              ),
            ),
          )),
    );
  }
}

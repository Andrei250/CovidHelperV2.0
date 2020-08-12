import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/components/vulnerable/need_help.dart';
import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/pages/register/register_email.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VulnerablesMain extends StatefulWidget {

  @override
  _VulnerablesMain createState() => _VulnerablesMain();
}

class _VulnerablesMain extends State<VulnerablesMain> {
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

  AppBar interfaceAppBar() {
    return AppBar(
      elevation:0,
      backgroundColor: AppTheme.lightAccent,
      leading: IconButton(
        icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: interfaceAppBar(),
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.grey[100],
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 32,
            curve: Curves.easeInBack,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.jumpToPage(index);
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
                title: Text('Raporteaza',
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
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                NeedHelp(),
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

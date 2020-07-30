import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covidhelper_v2/components/vulnerable/more_menu_vulnerable.dart';
import 'package:covidhelper_v2/components/vulnerable/need_help.dart';
import 'package:covidhelper_v2/components/vulnerable/report.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class VulnerableInterface extends StatefulWidget {

  @override
  _VulnerableInterface createState() => _VulnerableInterface();
}

class _VulnerableInterface extends State<VulnerableInterface> {
  int _currentIndex = 1;

  Widget _getFragment(int index) {
    if (index == 0) {
      return MoreMenuVulnerable();
    } else if (index == 2) {
      return NeedHelp();
    }
    return Report();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: AppTheme.primaryColor,
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 8,
            curve: Curves.easeInBack,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
              },);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.dehaze),
                title: Text('More'),
                activeColor: Colors.purpleAccent,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.live_help),
                title: Text('I need help'),
                activeColor: Colors.purpleAccent,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.report),
                title: Text('Report'),
                activeColor: Colors.purpleAccent,
                textAlign: TextAlign.center,
              )
            ],
          ),
          body: SizedBox.expand(
            child: PageView(
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                  Container(
                    child: _getFragment(_currentIndex),
                  ),
              ],
            ),
          ),
        );
  }
}

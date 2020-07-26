import 'package:covidhelper_v2/components/change_name.dart';
import 'package:covidhelper_v2/components/loading_screen.dart';
import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/pages/admin_panel.dart';
import 'package:covidhelper_v2/pages/register/register_choose.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'components/change_password.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Register(),
//      initialRoute: '/admin_panel',
//      onGenerateRoute: Routing.generateRoute,
));

//class Routing {
//  static Route<dynamic> generateRoute(RouteSettings settings) {
//    switch (settings.name) {
//      case '/admin_panel':
//        return MaterialPageRoute(builder: (_) => AdminPanel());
//        break;
//      case '/admin_panel/change_name':
//        return MaterialPageRoute(builder: (_) => ChangeName(data: settings.arguments));
//        break;
//      case '/admin_panel/change_password':
//        return MaterialPageRoute(builder: (_) => ChangePassword(data: settings.arguments));
//        break;
//      default:
//        return null;
//    }
//  }
//}
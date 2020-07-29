import 'package:covidhelper_v2/pages/admin_panel.dart';
import 'package:flutter/material.dart';

import 'components/change_name.dart';
import 'components/change_password.dart';
import 'components/update_user.dart';
import 'pages/login.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/admin_panel':
        return MaterialPageRoute(builder: (_) => AdminPanel());
        break;
      case '/admin_panel/change_name':
        return MaterialPageRoute(builder: (_) => ChangeName(data: settings.arguments));
        break;
      case '/admin_panel/change_password':
        return MaterialPageRoute(builder: (_) => ChangePassword(data: settings.arguments));
        break;
      case '/admin_panel/user/update_details':
        return MaterialPageRoute(builder: (_) => UpdateInfoUser(data: settings.arguments));
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
        break;
      default:
        return null;
    }
  }

}
import 'package:covidhelper_v2/pages/register_email.dart';
import 'package:covidhelper_v2/pages/register_name.dart';
import 'package:covidhelper_v2/pages/register_password.dart';
import 'package:covidhelper_v2/pages/register_phone.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/register_name',
      onGenerateRoute: RegisterAll.generateRoute,
    );
  }
}

class RegisterAll {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/register_name':
        return MaterialPageRoute(builder: (_) => RegisterName());
      case '/register_email':
        return MaterialPageRoute(builder: (_) => RegisterEmail());
      case '/register_phone':
        return MaterialPageRoute(builder: (_) => RegisterPhone());
      case '/register_password':
        return MaterialPageRoute(builder: (_) => RegisterPassword());
      default:
        return null;
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return MaterialApp(
          theme: AppTheme.darkTheme,
          home: Scaffold(
            body: Center(
              child:
                  Text('Error', style: AppTheme.darkTheme.textTheme.headline1),
            ),
          ));
    });
  }
}

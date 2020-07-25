import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/register/register_email.dart';
import 'package:covidhelper_v2/pages/home.dart';
import 'package:covidhelper_v2/pages/register/register_name.dart';
import 'package:covidhelper_v2/pages/register/register_password.dart';
import 'file:///C:/Users/pc3/Desktop/CovidHelperFlutter/CovidHelperV2.0/lib/pages/register/register_phone.dart';
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
    final args = settings.arguments;
    switch (settings.name) {
      case '/register_name':
        return MaterialPageRoute(builder: (_) => RegisterName());
      case '/register_email':
        print(args);

        return MaterialPageRoute(builder: (_) => RegisterEmail());

      case '/register_phone':
        print(args);
        return MaterialPageRoute(builder: (_) => RegisterPhone());
      case '/register_password':
        print(args);
        return MaterialPageRoute(builder: (_) => RegisterPassword());
        // TODO add pushReplacementNamed !!!!!!!!!!!!!!!
      case '/home':
        print(args);
        return MaterialPageRoute(builder: (_) => Home());
        break;
      default:
        print(args);
        return null;
    }
  }

/*    static Route<dynamic> _errorRoute() {
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
  }*/
}

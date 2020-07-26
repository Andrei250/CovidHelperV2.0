import 'package:covidhelper_v2/components/loading_screen.dart';
import 'package:covidhelper_v2/pages/home.dart';
import 'package:covidhelper_v2/pages/register/register_back.dart';
import 'package:covidhelper_v2/pages/register/register_email.dart';
import 'package:covidhelper_v2/pages/register/register_name.dart';
import 'package:covidhelper_v2/pages/register/register_password.dart';
import 'package:covidhelper_v2/pages/register/register_phone.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/register_name',
      onGenerateRoute: RegisterAll.generateRoute,
    );
  }
}

class RegisterAll {
  static String email;
  static String name;
  static String phoneNumber;
  static String password;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/register_name':
        return MaterialPageRoute(builder: (_) => RegisterName());
      case '/register_email':
        RegisterAll.name = args;
        return MaterialPageRoute(builder: (_) => RegisterEmail());
      case '/register_phone':
        RegisterAll.email = args;
        return MaterialPageRoute(builder: (_) => RegisterPhone());
      case '/register_password':
        RegisterAll.phoneNumber = args;
        return MaterialPageRoute(builder: (_) => RegisterPassword());
      case '/loading':
        RegisterAll.password = args;
        RegisterBack registerBack = new RegisterBack(
            name: RegisterAll.name,
            email: RegisterAll.email,
            phoneNumber: RegisterAll.phoneNumber,
            password: RegisterAll.password);
            new LoadingScreen(registerBack: registerBack);
        return MaterialPageRoute(builder: (_) => LoadingScreen(registerBack: registerBack));
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
        break;
      default:
        return null;
    }
  }
}

import 'package:covidhelper_v2/components/loading_screen.dart';
import 'package:covidhelper_v2/pages/register/new_loaging.dart';
import 'package:covidhelper_v2/pages/register/register_back.dart';
import 'package:covidhelper_v2/pages/register/register_choose.dart';
import 'package:covidhelper_v2/pages/register/register_email.dart';
import 'package:covidhelper_v2/pages/register/register_name.dart';
import 'package:covidhelper_v2/pages/register/register_password.dart';
import 'package:covidhelper_v2/pages/register/register_phone.dart';
import 'package:covidhelper_v2/pages/register/transition.dart';
import 'package:covidhelper_v2/pages/volunteer/home_volunteer/home.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/register_choose',
      onGenerateRoute: RegisterAll.generateRoute,
    );
  }
}

class RegisterAll {
  static String email;
  static String name;
  static String phoneNumber;
  static String password;
  static String userValue;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/register_choose':
        return CustomRoute(builder: (_) => RegisterChoose());
      case '/register_email':
        RegisterAll.userValue = args;
        return CustomRoute(builder: (_) => RegisterEmail());
        case '/register_loading':
        RegisterAll.userValue = args;
        return CustomRoute(builder: (_) => NewLoading());
      case '/register_password':
        RegisterAll.email = args;
        return CustomRoute(builder: (_) => RegisterPassword());
      case '/register_name':
        RegisterAll.password = args;
        return CustomRoute(builder: (_) => RegisterName());
      case '/register_phone':
        RegisterAll.name = args;
        return CustomRoute(builder: (_) => RegisterPhone());
      case '/loading':
        RegisterAll.phoneNumber = args;
        print(RegisterAll.password);
        RegisterBack registerBack = new RegisterBack(
            name: RegisterAll.name,
            email: RegisterAll.email,
            phoneNumber: RegisterAll.phoneNumber,
            password: RegisterAll.password,
            userValue: RegisterAll.userValue);
        new LoadingScreen(registerBack: registerBack);
        return CustomRoute(
            builder: (_) => LoadingScreen(registerBack: registerBack));
      case '/home':
        return CustomRoute(builder: (_) => Home());
//        return CustomRoute(builder: (_) => Home(volunteer: args));
        break;
      default:
        return null;
    }
  }
}
//volunteer: args,

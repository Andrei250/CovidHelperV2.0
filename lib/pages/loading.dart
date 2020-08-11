import 'package:covidhelper_v2/models/user.dart';
import 'package:covidhelper_v2/models/volunteer.dart';
import 'package:covidhelper_v2/pages/register/register_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void loading() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user;
    User currentUser;
    user = await _auth.currentUser();

    await Future.delayed(Duration(seconds: 2), () {});

    if (user != null) {
      currentUser = await FirestoreService().getUser(user);
      if (currentUser.user_value == 'Admins') {
        Navigator.pushNamedAndRemoveUntil(context, '/admin_panel', (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loading();
    return MaterialApp(
      home: Center(
        child: SpinKitDoubleBounce(
          color: AppTheme.lightColor,
        ),
      ),
    );
  }
}

import 'package:covidhelper_v2/models/volunteer.dart';
import 'package:covidhelper_v2/pages/register/register_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final RegisterBack registerBack;

  const LoadingScreen({Key key, this.registerBack}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future loading() async {
//    await widget.registerBack.addNewUser();

    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user;
    user = await _auth.currentUser();

    if (user == null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/login', (Route<dynamic> route) => false);
    } else {
      var data = await FirestoreService().getUserData(user);

      if (data != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            data['route'], (Route<dynamic> route) => false, arguments: data);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: SpinKitDoubleBounce(
          color: AppTheme.lightColor,
        ),
      ),
    );
  }
}

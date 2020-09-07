import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/vendor.dart';
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

    await widget.registerBack.addNewUser();

    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser currentUser;
    Firestore _db = Firestore.instance;

    currentUser = await _auth.currentUser();
    var userData = await _db.collection("Users").document(currentUser.uid).get();
    var userInfo = await _db
        .collection(userData['user_value'])
        .document(currentUser.uid)
        .get();
    Map<String, dynamic> retrievedData = new Map<String, dynamic>();
    retrievedData['userInfo'] = userInfo;

    if (userData['user_value'] == 'Vulnerables') {
      retrievedData['route'] = '/vulnerable_main';
      retrievedData['type'] = "vulnerable";
      retrievedData['vendors'] = FirestoreService().vendors;
    } else if (userData['user_value'] == "Admins") {
      retrievedData['route'] = '/admin_panel';
      retrievedData['type'] = "admin";
    } else if (userData['user_value'] == 'volunteer') {
      retrievedData['route'] = '/volunteer_home';
      retrievedData['type'] = 'volunteer';
    } else if (userData['user_value'] == 'vendor') {
      retrievedData['route'] = '/vendor_home';
      retrievedData['type'] = "vendor";
    }

    if (widget.registerBack.userValue == 'volunteer') {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/home', (Route<dynamic> route) => false,
          arguments: retrievedData);
    } else if (widget.registerBack.userValue == 'vendor') {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/home', (Route<dynamic> route) => false,
          arguments: retrievedData);
    }
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitChasingDots(
          color: AppTheme.lightAccent,
        ),
      ),
    );
  }
}

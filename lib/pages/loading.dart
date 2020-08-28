import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/components/starting_loading.dart';
import 'package:covidhelper_v2/models/user.dart';
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
    Firestore _db = Firestore.instance;

    await Future.delayed(Duration(seconds: 2), () {});

    if (user != null) {
      currentUser = await FirestoreService().getUser(user);
      var userData =
          await _db.collection("Users").document(currentUser.uid).get();
      var userInfo = await _db
          .collection(userData['user_value'])
          .document(currentUser.uid)
          .get();
      Map<String, dynamic> retrievedData = new Map<String, dynamic>();
      retrievedData['userInfo'] = userInfo;

      if (userData['user_value'] == 'Vulnerables') {
        retrievedData['route'] = '/vulnerable_main';
        retrievedData['type'] = "vulnerable";
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

      Navigator.pushNamedAndRemoveUntil(
          context, retrievedData['route'], (route) => false,
          arguments: retrievedData);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/register_choose', (route) => false);
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
      home: StartingLoading()
    );
  }
}

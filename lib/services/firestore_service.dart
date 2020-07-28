import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/admin.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/models/volunteer.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class FirestoreService {
  Firestore _db = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<VulnerablePerson>> get vulnerables {
    return _db.collection('Vulnerables').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => VulnerablePerson.fromJson(document.data))
        .toList());
  }

  Stream<List<Volunteer>> get volunteer {
    return _db.collection('volunteer').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Volunteer.fromJson(document.data))
        .toList());
  }

  Future<void> addVulnerablePerson(VulnerablePerson person) {
    Map<String, dynamic> dataMap = person.toJson();
    return _db.collection("Vulnerables").document(person.uid).setData(dataMap);
  }

  Future<void> addUser(String uid, String user_value) {
    var dataMap = Map<String, dynamic>();
    dataMap['user_value'] = user_value;
    return _db.collection('Users').document(uid).setData(dataMap);
  }

  Future createVulnerablePerson(String email, String password, String address,
      String phone, String first_name, String last_name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      VulnerablePerson person = new VulnerablePerson(
        first_name: first_name,
        last_name: last_name,
        email: email,
        address: address,
        phone: phone,
        uid: user.uid,
      );
      await addVulnerablePerson(person);
      await addUser(user.uid, "0");
      return 200;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> addNewVendor(Vendor vendor, String userValue) {
    Map<String, dynamic> dataMap = vendor.toJson();
    return _db.collection(userValue).document(vendor.uid).setData(dataMap);
  }

  Future<void> addNewVolunteer(Volunteer volunteer, String userValue) {
    Map<String, dynamic> dataMap = volunteer.toJson();
    return _db.collection(userValue).document(volunteer.uid).setData(dataMap);
  }

  Future createVendorVolunteer(
      {String email,
      String password,
      String phoneNumber,
      String name,
      String userValue}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (userValue == 'vendor') {
        Vendor vendor = new Vendor(
            name: name, email: email, phoneNumber: phoneNumber, uid: user.uid);
        await addNewVendor(vendor, userValue);
        await addUser(vendor.uid, userValue);
        return 200;
      } else {
        Volunteer volunteer = new Volunteer(
            name: name, email: email, phoneNumber: phoneNumber, uid: user.uid);
        await addNewVolunteer(volunteer, userValue);
        await addUser(volunteer.uid, userValue);
        return 200;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Admin> getAdmin(FirebaseUser user) async {
    var userData = await _db.collection('Admins').document(user.uid).get();

    if (userData != null) {
      Admin admin = new Admin(
          first_name: userData['first_name'],
          last_name: userData['last_name'],
          email: userData['email']);
      return admin;
    }
    return null;
  }

  Future<Volunteer> getVolunteer(FirebaseUser user) async {
    var userData = await _db.collection('volunteer').document(user.uid).get();
    if (userData != null) {
      Volunteer volunteer = new Volunteer(
          name: userData['name'],
          email: userData['email'],
          phoneNumber: userData['phoneNumber']);
      return volunteer;
    }
    return null;
  }

  Future changeNameAdmin(String uid, Admin admin) async {
    try {
      var dataMap = admin.toJson();
      _db.collection('Admins').document(uid).setData(dataMap);
      return 200;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future changePassAdmin(FirebaseUser user, Admin admin, String password,
      String new_password) async {
    try {
      AuthCredential result = EmailAuthProvider.getCredential(
          email: admin.email, password: password);

      if (result == null) {
        return 404;
      }

      user.updatePassword(new_password).then((_) {
        return 200;
      }).catchError((onError) {
        print(onError.toString());
        return 404;
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
  Future deleteVulnerable(VulnerablePerson person) async {
    try {
      await http.post(
        'https://jsonplaceholder.typicode.com/albums',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userEmail': person.email,
        }),
      );

      await _db.collection('Users').document(person.uid).delete();
      await _db.collection('Vulnerables').document(person.uid).delete();

      return 200;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}


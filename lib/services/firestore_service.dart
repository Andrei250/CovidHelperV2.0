import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/admin.dart';
import 'package:covidhelper_v2/models/user.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/models/volunteer.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  
   Stream<List<Products>> getProductsStream(String uid) {
     return _db.collection('vendor')
         .document(uid)
         .collection('Products')
         .orderBy('stock')
         .snapshots()
         .map((snapshot) => snapshot.documents
         .map((document) => Products.fromJson(document.data))
         .toList());
   }

  List<Products> getProducts(String uid) {
    var data = _db
        .collection('vendor')
        .document(uid)
        .collection('Products')
        .orderBy('stock')
        .snapshots()
        .map((snapshot) => snapshot.documents
        .map((document) => Products.fromJson(document.data))
        .toList());

    List<Products> list = new List<Products>();

    data.forEach((element) {
      list.forEach((element) {
        list.add(element);
      });
    });

    return list;
  }


  Stream<List<Vendor>> get vendors {
    return _db.collection('vendor').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Vendor.fromJson(document.data))
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
      await addUser(user.uid, "Vulnerables");
      return 200;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> addReport(
      String type, String full_name, String message, FirebaseUser user) {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['full_name'] = full_name;
    data['message'] = message;
    data['user_uid'] = user.uid;
    return _db.collection("reports").document(user.uid).setData(data);
  }

  Future createReport(String type, String full_name, String message) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      await addReport(type, full_name, message, user);
      return 200;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> addFeedback(String message, FirebaseUser user) {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['user_uid'] = user.uid;
    return _db.collection("feedback").add(data);
  }

  Future createFeedback(String message) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      await addFeedback(message, user);
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
      String address,
      String userValue}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (userValue == 'vendor') {
        Vendor vendor = new Vendor(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            address: address,
            uid: user.uid);
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

  Future<Map<String, dynamic>> getUserData(FirebaseUser user) async {
    var userData = await _db.collection("Users").document(user.uid).get();
    var userInfo =
        await _db.collection(userData['user_value']).document(user.uid).get();
    Map<String, dynamic> retrievedData = new Map<String, dynamic>();
    retrievedData['userInfo'] = userInfo;

    if (userData['user_value'] == 'Vulnerables') {
      retrievedData['route'] = '/vulnerable_main';
      retrievedData['type'] = "vulnerable";
      retrievedData['vendors'] = FirestoreService().vendors;
    } else if (userData['user_value'] == "Admins") {
      retrievedData['route'] = '/admin_panel';
      retrievedData['type'] = "admin";
    } else if (userData['user_value'] == 'vendor') {
      retrievedData['route'] = '/vendor_home';
      retrievedData['type'] = "vendor";
    } else if (userData['user_value'] == 'volunteer') {
      retrievedData['route'] = '/volunteer_home';
      retrievedData['type'] = 'volunteer';
    }
    return retrievedData;
  }

  Future login(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      var userData = await _db.collection("Users").document(user.uid).get();
      var userInfo =
          await _db.collection(userData['user_value']).document(user.uid).get();
      Map<String, dynamic> retrievedData = new Map<String, dynamic>();
      retrievedData['userInfo'] = userInfo;

      if (userData['user_value'] == 'Vulnerables') {
        retrievedData['route'] = '/vulnerable_main';
        retrievedData['type'] = "vulnerable";
      } else if (userData['user_value'] == 'volunteer') {
        retrievedData['route'] = '/volunteer_home';
        retrievedData['type'] = 'volunteer';
      } else if (userData['user_value'] == 'vendor') {
        retrievedData['route'] = '/vendor_home';
        retrievedData['type'] = "vendor";
      } else if (userData['user_value'] == "Admins") {
        retrievedData['route'] = '/admin_panel';
        retrievedData['type'] = "admin";
      }
      return retrievedData;
    } catch (error) {
      print(error.toString());
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

  Future<Vendor> getVendor(FirebaseUser user) async {
    var userData = await _db.collection('vendor').document(user.uid).get();
    if (userData != null) {
      Vendor vendor = new Vendor(
          name: userData['name'],
          email: userData['email'],
          address: userData['address'],
          phoneNumber: userData['phoneNumber']);
      return vendor;
    }
    return null;
  }

  Future<User> getUser(FirebaseUser user) async {
    var userData = await _db.collection('Users').document(user.uid).get();
    if (userData != null) {
      User currentUser = new User(
          uid: user.uid, email: user.email, user_value: userData['user_value']);
      return currentUser;
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

  Future deleteUser(FirebaseUser user, String password) async {
    String uid = user.uid;
    try {
      AuthResult result = await user.reauthenticateWithCredential(
          EmailAuthProvider.getCredential(
              email: user.email, password: password));
      await result.user.delete().then((_) async {
        await _db.collection('Users').document(uid).delete();
        await _db.collection('Vulnerables').document(uid).delete();
      });

      return 200;
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

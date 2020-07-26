import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/admin.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<VulnerablePerson>> get vulnerables {
    return _db.collection('Vulnerables').snapshots().map((snapshot) =>
        snapshot
            .documents
            .map((document) => VulnerablePerson.fromJson(document.data))
            .toList());
  }
  Stream<List<Vendor>> get vendors {
    return _db.collection('Vendors').snapshots().map((snapshot) =>
        snapshot
            .documents
            .map((document) => Vendor.fromJson(document.data))
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

  Future<void> addNewVendor (Vendor vendor) {
    Map<String, dynamic> dataMap = vendor.toJson();
    return _db.collection('Vendors').document(vendor.uid).setData(dataMap);
  }

  Future createUser({String email, String password, String phoneNumber,
      String name}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      Vendor vendor = new Vendor(
          name: name, email: email, phoneNumber: phoneNumber, uid: user.uid);
      await addNewVendor(vendor);
      await addUser(vendor.uid, "vendor");
      return 200;
    } catch (e) {
      print (e.toString());
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
}

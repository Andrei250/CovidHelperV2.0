import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  String name;
  String emailAddress;
  String phoneNumber;
  String uid;

  AuthService(this.name, this.emailAddress, this.phoneNumber, this.uid);

  final FirebaseAuth _auth = FirebaseAuth.instance;

//  Vendor _vendorFromFirebaseUser(FirebaseUser vendor) {
//    return vendor != null
//        ? Vendor(
//            name: name, email: emailAddress, phoneNumber: phoneNumber, uid: uid)
//        : null;
//  }

  Future registerEmailPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await Firestore.instance.collection('vendor').document(user.uid).setData({
        'name': name,
        'email': emailAddress,
        'phoneNumber': phoneNumber,
        'uid': uid
      });
      return null;

    } catch (e) {
      return e.message;
    }
  }
}

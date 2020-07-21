import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Stream<List<VulnerablePerson>> get vulnerables {
    return _db
        .collection('Vulnerables')
        .snapshots()
        .map((snapshot) => snapshot.documents
        .map((document) => VulnerablePerson.fromJson(document.data))
        .toList());
  }

  Future<void> addVulnerablePerson(VulnerablePerson person) {
    Map<String, dynamic> dataMap = person.toJson();

    return _db.collection("Vulnerables").add(dataMap);
  }
}
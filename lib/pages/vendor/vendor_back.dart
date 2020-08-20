import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';


class VendorBack {

  VendorBack({this.uid});

  final String uid;

  Future addStock(String categorydoc, String category, String product, int stock) async{
    CollectionReference cat = Firestore.instance.collection('vendor').document(uid).collection(categorydoc);
    var dataMap = Map<String, int>();
    dataMap[product] = stock;
    return await cat.document(category).setData(dataMap);
  }


}

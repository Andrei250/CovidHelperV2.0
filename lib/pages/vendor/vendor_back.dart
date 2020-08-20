import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';


class VendorBack {

  VendorBack({this.uid});

  final String uid;

  Future addStock(String categorydoc, String category, String product, int stock, double price) async{
    CollectionReference cat = Firestore.instance.collection('vendor').document(uid).collection(categorydoc);
    var dataMap = Map<String, Products>();
    dataMap[product] = Products(price: price, stock: stock);
    return await cat.document(category).setData(dataMap);
  }

}

class Products{

  Products({this.price, this.stock});

  int stock;
  double price;

}

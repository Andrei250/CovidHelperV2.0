import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VendorBack {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future addStock(String categoryDoc, String category, String product,
      String stock, String price) async {
    FirebaseUser user = await _auth.currentUser();
    CollectionReference cat = Firestore.instance
        .collection('vendor')
        .document(user.uid)
        .collection(categoryDoc);
    Products products = new Products(price: price, stock: stock, name: product);
    Map<String, dynamic> dataMap = new Map<String, dynamic>();
    dataMap.putIfAbsent(product, () => products.toJson());
    return cat.document(category).setData(dataMap, merge: true);
  }



  Future addStockToProducts(String product,
      String stock, String price, bool isShop) async {
    FirebaseUser user = await _auth.currentUser();
    CollectionReference cat = Firestore.instance
        .collection('vendor')
        .document(user.uid)
        .collection('Products');
    var dataMap = Map<String, dynamic>();
    dataMap['isShop'] = isShop;
    dataMap['name'] = product;
    dataMap['price'] = price;
    dataMap['stock'] = stock;
    return cat.document(product).setData(dataMap, merge: true);
  }

}

class Products {
  Products({this.price, this.stock, this.name});

  String stock;
  String price;
  String name;
  bool isShop;  // true if it's a shop, false otherwise (pharmacy)


  Products.fromJson(Map<String, dynamic> parsedJson)
      : stock = parsedJson['stock'] ?? '',
        price = parsedJson['price'] ?? '',
        isShop = parsedJson['isShop'] ?? '',
        name = parsedJson['name'] ?? '';

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['stock'] = this.stock;
    dataMap['price'] = this.price;
    dataMap['isShop'] = this.isShop;
    dataMap['name'] = this.name;
    return dataMap;
  }
}


class ListOfProducts{
  Firestore _db = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  String uid ;

   Stream<List<Products>> get products async* {
     FirebaseUser user = await _auth.currentUser();
     uid = user.uid;
      yield* _db
          .collection('vendor')
          .document(uid)
          .collection('Products')
          .orderBy('stock')
          .snapshots()
          .map((snapshot) => snapshot.documents
          .map((document) => Products.fromJson(document.data))
          .toList());
  }
}
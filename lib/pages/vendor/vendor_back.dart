import 'package:cloud_firestore/cloud_firestore.dart';

class VendorBack {
  VendorBack({this.uid});

  final String uid;

  //   adds product in its category (e.g. Iaurt -> Lactate)
  Future addStock(String categoryDoc, String category, String product,
      String stock, String price) async {
    try {
      CollectionReference cat = Firestore.instance
          .collection('vendor')
          .document('ACrR5h6tkFNshrsPrgLndmz0K4t2')
          .collection(categoryDoc);
      Products products =
          new Products(price: price, stock: stock, name: product);
      Map<String, dynamic> dataMap = new Map<String, dynamic>();
      dataMap.putIfAbsent(product, () => products.toJson());
      await addProduct(product, stock, price);
      cat.document(category).setData(dataMap);
      return 200;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  adds product in the all products list in firebase
  Future addProduct(String product, String stock, String price) async {
    try {
      CollectionReference cat = Firestore.instance
          .collection('vendor')
          .document('ACrR5h6tkFNshrsPrgLndmz0K4t2')
          .collection('Products');
      Products products =
          new Products(price: price, stock: stock, name: product);
      Map<String, dynamic> dataMap = products.toJson();
      cat.document(product).setData(dataMap, merge: false);
      return 200;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class Products {
  Products({this.price, this.stock, this.name});

  String stock;
  String price;
  String name;

  Products.fromJson(Map<String, dynamic> parsedJson)
      : stock = parsedJson['stock'] ?? '',
        price = parsedJson['price'] ?? '',
        name = parsedJson['name'] ?? '';

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['stock'] = this.stock;
    dataMap['price'] = this.price;
    dataMap['name'] = this.name;
    return dataMap;
  }
}

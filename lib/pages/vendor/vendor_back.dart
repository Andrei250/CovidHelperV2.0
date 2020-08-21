import 'package:cloud_firestore/cloud_firestore.dart';

class VendorBack {
  VendorBack({this.uid});

  final String uid;

  Future addStock(String categoryDoc, String category, String product,
      int stock, double price) async {
    CollectionReference cat = Firestore.instance
        .collection('vendor')
        .document('ACrR5h6tkFNshrsPrgLndmz0K4t2')
        .collection(categoryDoc);
    Products products = new Products(price: price, stock: stock);
    Map<String, dynamic> dataMap = new Map<String, dynamic>();
    dataMap.putIfAbsent(product, () => products.toJson());
    await addProduct(product, stock, price);
    return cat.document(category).setData(dataMap);
  }
}

  Future addProduct(String product,
      int stock, double price) async {
    CollectionReference cat = Firestore.instance
        .collection('vendor')
        .document('ACrR5h6tkFNshrsPrgLndmz0K4t2')
        .collection('Products');
    Products products = new Products(price: price, stock: stock);
    Map<String, dynamic> dataMap = new Map<String, dynamic>();
    dataMap.putIfAbsent(product, () => products.toJson());
    return cat.document(product).setData(dataMap);

  }

class Products {
  Products({this.price, this.stock});

  int stock;
  double price;

  Products.fromJson(Map<String, dynamic> parsedJson)
      : stock = parsedJson['stock'] ?? '',
        price = parsedJson['price'] ?? '';

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['stock'] = this.stock;
    dataMap['price'] = this.price;
    return dataMap;
  }
}

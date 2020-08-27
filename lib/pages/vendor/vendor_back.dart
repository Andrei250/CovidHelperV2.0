import 'package:cloud_firestore/cloud_firestore.dart';

class VendorBack {
  VendorBack({this.uid});

  final String uid;

  Future addStock(String categoryDoc, String category, String product,
      String stock, String price) async {
    CollectionReference cat = Firestore.instance
        .collection('vendor')
        .document('ACrR5h6tkFNshrsPrgLndmz0K4t2')
        .collection(categoryDoc);
    Products products = new Products(price: price, stock: stock, name: product);
    Map<String, dynamic> dataMap = new Map<String, dynamic>();
    dataMap.putIfAbsent(product, () => products.toJson());
    return cat.document(category).setData(dataMap, merge: true);
  }



  Future addStockToProducts( String product,
      String stock, String price, bool isShop) async {
    CollectionReference cat = Firestore.instance
        .collection('vendor')
        .document('ACrR5h6tkFNshrsPrgLndmz0K4t2')
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
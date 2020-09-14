import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/models/volunteer.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:geolocator/geolocator.dart';

class Heuristics {
  Heuristics({this.order});

  static const double distanceHeu = -0.1;
  static const stockHeu = 0.1;

  Orders order;
  Volunteer volunteer;

  Map<dynamic, Vendor> vendors = Map<dynamic, Vendor>();
  Map<dynamic, Products> products = Map<dynamic, Products>();

  Future<Map<dynamic, Vendor>> getVendors() async {
    int aux = 0;
    Map<dynamic, Vendor> vendorLocal = Map<dynamic, Vendor>();
    await Firestore.instance
        .collection("vendor")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((document) {
        final String address = Vendor.fromJson(document.data).address;
        final String lat = Vendor.fromJson(document.data).lat;
        final String long = Vendor.fromJson(document.data).long;
        final String name = Vendor.fromJson(document.data).name;
        final String email = Vendor.fromJson(document.data).email;
        final String phoneNumber = Vendor.fromJson(document.data).phoneNumber;
        final String uid = Vendor.fromJson(document.data).uid;

        Vendor newVendor = new Vendor(
            address: address,
            lat: lat,
            long: long,
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            uid: uid);

        vendorLocal.putIfAbsent(aux++, () => newVendor);
      });
    });
    return vendorLocal;
  }

  Future<Map<dynamic, Products>> getProducts(String uid) async {
    Map<dynamic, Products> productLocal = Map<dynamic, Products>();

    await Firestore.instance
        .collection('vendor')
        .document(uid)
        .collection('Products')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((document) {
        String stock = Products.fromJson(document.data).stock;
        String name = Products.fromJson(document.data).name;
        String price = Products.fromJson(document.data).price;
        bool isShop = Products.fromJson(document.data).isShop;
        Products product = new Products(
            stock: stock, name: name, price: price, isShop: isShop);

        productLocal.putIfAbsent(product.name, () => product);
      });
    });
    return productLocal;
  }

  Future<dynamic> calculateDistance(Orders order, Vendor vendor) async {
    double dist = await Geolocator().distanceBetween(double.parse(vendor.lat),
        double.parse(vendor.long), order.latitude, order.longitude);
    return dist / 1000;
  }

  double calculateScore() {
    return 101112;
  }

  void printare() async {
    vendors = await getVendors();
    print('0000000000000000000000000000000000000000000000000000000');
    print(await calculateDistance(order, vendors[4]));
  }

  // function which calculates the percent of the products that are in stock
  // the vendor must be provided as a parameter
  Future<double> stockPercent(Vendor vendor) async {
    products = await getProducts(vendor.uid);
    double availableProducts = 0;
    if (order.products.length != 0) {
      order.products.forEach((key, value) {
        bool found = false;
        if (products[key] != null) {
          if (double.parse(products[key].stock) >= value) {
            found = true;
            availableProducts++;
          }
        }
      });
      return (availableProducts / order.products.length);
    }
    return 0;
  }
}

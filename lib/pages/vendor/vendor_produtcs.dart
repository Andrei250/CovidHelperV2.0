import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_products_card.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorProducts extends StatefulWidget {
  VendorProducts(
      {this.limit, this.number, this.customHeight, this.onAddButtonPressed});

  bool limit;
  int number;
  double customHeight;
  final VoidCallback onAddButtonPressed;

  @override
  _VendorProductsState createState() => _VendorProductsState();
}

class _VendorProductsState extends State<VendorProducts> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.customHeight,
      child: StreamProvider<List<Products>>.value(
          value: ListOfProducts().products,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: VendorProductsCards(
              limit: widget.limit,
              number: widget.number,
              onAddButtonPressed: widget.onAddButtonPressed,
            ),
          )),
    );
  }
}

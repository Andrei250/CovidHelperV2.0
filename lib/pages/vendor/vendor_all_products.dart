import 'package:covidhelper_v2/pages/vendor/vendor_produtcs.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class VendorAllProducts extends StatefulWidget {
  VendorAllProducts({this.limit, this.number, this.customHeight});

  bool limit;
  int number;
  double customHeight;

  @override
  _VendorAllProductsState createState() => _VendorAllProductsState();
}

class _VendorAllProductsState extends State<VendorAllProducts> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Material(
        type: MaterialType.transparency,
        child: Container(
      height: deviceHeight,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
            child: Center(
                child: Text(
              'Produsele tale',
              style: eTitle,
            )),
          ),
          VendorProducts(
            limit: widget.limit,
            number: widget.number,
            customHeight: deviceHeight * 0.85,
          ),
        ],
      ),
    ));
  }
}

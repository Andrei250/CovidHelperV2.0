import 'package:covidhelper_v2/pages/vendor/product_card.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorProductsCards extends StatefulWidget {
  VendorProductsCards({this.limit, this.number, this.customHeight});

  bool limit;
  int number;
  double customHeight;


  @override
  _VendorProductsCardsState createState() => _VendorProductsCardsState();
}

class _VendorProductsCardsState extends State<VendorProductsCards> {

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Products>>(context);

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // TODO FIX the limit must be greater than the number of products that are in stock
          itemCount: products != null
              ? widget.limit == true ? widget.number : products.length
              : 0,
         // itemCount: products != null ? products.length : 0,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        )
      ],
    );
  }
}

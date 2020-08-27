import 'package:covidhelper_v2/pages/vendor/product_card.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorProductsCards extends StatefulWidget {
  VendorProductsCards(
      {this.limit, this.number, this.customHeight, this.onAddButtonPressed});

  bool limit;
  int number;
  double customHeight;
  final VoidCallback onAddButtonPressed;

  @override
  _VendorProductsCardsState createState() => _VendorProductsCardsState();
}

class _VendorProductsCardsState extends State<VendorProductsCards> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Products>>(context);

    dynamic items() {
      if (widget.limit == true) {
        if (products.length < widget.number) {
          return products.length;
        } else {
          return widget.number;
        }
      } else {
        return products.length;
      }
    }

    try {
      if (products != null && products.isNotEmpty) {
        return ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items(),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            )
          ],
        );
      } else {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: FlatButton(
                onPressed: widget.onAddButtonPressed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  'Adauga produse in stoc',
                  style: eButton,
                ),
                color: AppTheme.lightAccent,
              ),
            ));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

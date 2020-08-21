import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/pages/vendor/product_card.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorProductsCards extends StatefulWidget {
  VendorProductsCards({this.limit, this.number});

  bool limit;
  int number;

  @override
  _VendorProductsCardsState createState() =>
      _VendorProductsCardsState();
}

class _VendorProductsCardsState extends State<VendorProductsCards> {
  final FirestoreService _db = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final vulnerables = Provider.of<List<VulnerablePerson>>(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: vulnerables != null
              ? widget.limit == true ? widget.number : vulnerables.length
              : 0,
//          itemCount: vulnerables != null ? vulnerables.length : 0,
          itemBuilder: (context, index) {
            return ProductCard(vulnerablePerson: vulnerables[index]);
          },
        )
      ],
    );
  }
}

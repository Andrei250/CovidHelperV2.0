import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_processing_orders.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'orders_card.dart';

class VendorOrders extends StatefulWidget {
  VendorOrders(
      {this.limit, this.number, this.customHeight});

  bool limit;
  int number;
  double customHeight;

  @override
  _VendorOrdersState createState() => _VendorOrdersState();
}

class _VendorOrdersState extends State<VendorOrders> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.customHeight,
      child: StreamProvider<List<Orders>>.value(
          value: ListOfOrders().orders,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ProcessingOrders(
              limit: widget.limit,
              number: widget.number,
            ),
          )),
    );
  }
}

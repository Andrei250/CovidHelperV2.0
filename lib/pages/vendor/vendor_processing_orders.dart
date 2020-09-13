import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/pages/vendor/orders_card.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_coming_volunteer.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:provider/provider.dart';

class ProcessingOrders extends StatefulWidget {
  ProcessingOrders({this.limit, this.number, this.customHeight, Orders order,});

  bool limit;
  int number;
  double customHeight;
  @override
  _ProcessingOrdersState createState() => _ProcessingOrdersState();
}

class _ProcessingOrdersState extends State<ProcessingOrders> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Orders>>(context);

    dynamic items() {
      if (widget.limit == true) {
        if (orders.length < widget.number) {
          return orders.length;
        } else {
          return widget.number;
        }
      } else {
        return orders.length;
      }
    }

      try {
        if (orders != null && orders.isNotEmpty) {
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
                  return OrderCard(order: orders[index]);
                },
              )
            ],
          );
        } else {
          return Container(
            child: Text(
              'Nu ai nicio comanda',
              style: eTitle,
            ),
          ) ;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }


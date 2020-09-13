import 'package:covidhelper_v2/models/orders.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_coming_volunteer.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatefulWidget {
  OrderCard({this.order});
  Orders order;
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {

    return Container(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(25.0)),
                  child: Container(
                    width: double.maxFinite,
                    height: 90.0,
                    color: AppTheme.lightAccent,
                    child: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: SvgPicture.asset(
                                    clock,
                                    height: 25.0,
                                    width: 25.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Text(
                                    'Voluntarul va ajunge in XXX minute',
                                    style: eProducts,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: SvgPicture.asset(
                                    pack,
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    'Trebuie sa pregatesti 15 produse',
                                    style: eProducts,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
                ClipRRect(
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(25.0)),
                  child: Container(
                    width: double.maxFinite,
                    height: 130.0,
                    color: Colors.grey[200],
                    child: VendorComingVolunteer(name: 'Vlad Udrescu' + widget.order.address),
                  ),
                ),
              ],
            ),
          ),
        ])
    );
  }
}

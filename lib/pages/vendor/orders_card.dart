import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/models/volunteer.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_coming_volunteer.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



class VolunteerVendorOrder {
  Firestore _db = Firestore.instance;

  Future<Volunteer> getVolunteer(String uid) async {
    var userData = await _db.collection('volunteer').document(uid).get();
    Volunteer volunteer = new Volunteer(
        name: userData['name'],
        email: userData['email'],
        phoneNumber: userData['phoneNumber']);
    return volunteer;
  }

  Future<Vendor> getVendor(String uid) async {
    var userData = await _db.collection('vendor').document(uid).get();
    Vendor vendor = new Vendor(
        name: userData['name'],
        email: userData['email'],
        phoneNumber: userData['phoneNumber']);
    return vendor;
  }
}

class OrderCard extends StatefulWidget {
  OrderCard({this.order});
  Orders order;
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {

  double volunteerLat = 45.030107;
  double volunteerLong = 23.275671;

  Vendor vendor;
  var vendorLatDouble;
  var vendorLongDouble;

  final double speed = 1.4; // m/s -- average speed when walking

  var distance;
  String unit;
  String time;
  double timeDouble;
  String timeUnit;
  String timeUnitSecond;
  String timeSecond = null;

  Volunteer currentVolunteer;
  String name = '';
  String phonenumber = '';

  Future<void> _getVendor() async{
    vendor = await VolunteerVendorOrder().getVendor(widget.order.vendor_uid);
    print(widget.order.vendor_uid);
    print(vendor.lat);
    print('444444444444444444444444444444444444444444444444444');
    setState(() {
      vendorLatDouble = double.parse(vendor.lat);
      assert(vendorLatDouble is double);

      vendorLongDouble = double.parse(vendor.long);
      assert(vendorLongDouble is double);
    });
  }

  Future<void> _getVolunteer() async {
    currentVolunteer = await VolunteerVendorOrder().getVolunteer(
        widget.order.volunteer_uid);
    setState(() {
      name = currentVolunteer.name;
      phonenumber = currentVolunteer.phoneNumber;
    });
  }

  Future<void> _calculateDistance() async {



    var dist = await Geolocator().distanceBetween(
        volunteerLat,
        volunteerLong,
        vendorLatDouble,
        vendorLongDouble);

    timeDouble = dist / speed;

    if (timeDouble < 60) {
      time = '1';
      timeUnit = 'min';
    } else if (timeDouble >= 60 && timeDouble < 3600) {
      time = (timeDouble / 60).floor().toString();
      timeUnit = 'min';
    } else if (timeDouble >= 3600) {
      double decimals = timeDouble / 3600 - (timeDouble / 3600).floor();
      timeSecond = (decimals * 60).floor().toString();
      time = (timeDouble / 3600).floor().toString();
      timeUnit = 'ore';
    }
    if (dist >= 1000) {
      dist /= 1000;
      unit = 'km';
    } else {
      unit = 'm';
    }
    distance = dist.floor();
  }



  @override
  void initState(){
    super.initState();
    _getVolunteer();
    _getVendor();
    _calculateDistance();
  }


  @override

  Widget build(BuildContext context) {
    _getVendor();
    print(vendorLatDouble);
    print('3333333333333333333333333333333333333333333333333333333');
    print(name);
    var products = widget.order.products.values;
    var numberOfProducts = products.reduce((sum, element) => sum + element);
    return Container(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 15.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(25.0)),
                  child: Container(
                    width: double.maxFinite,
                    height: 80.0,
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
                                    'Voluntarul se afla la ' +
                                        distance.toString() +
                                        ' ' +
                                        unit.toString() +
                                        ' de tine',
                                    style: eProducts,
                                  ),
                                ),
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
                                    'Trebuie sa pregatesti ${numberOfProducts} produse',
                                    style: eProducts,
                                  ),
                                ),
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
                    child: VendorComingVolunteer(name: name, phonenumber: phonenumber, order: widget.order),
                  ),
                ),
              ],
            ),
          ),
        ])
    );
  }
}

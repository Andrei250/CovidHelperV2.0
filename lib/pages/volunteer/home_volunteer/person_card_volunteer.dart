import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/components/heuristics.dart';
import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:covidhelper_v2/utils/volunteer_orders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class PersonCardVolunteer extends StatefulWidget {
  PersonCardVolunteer({this.orders, this.longitude, this.latitude});

  Orders orders;
  String latitude;
  String longitude;

  @override
  _PersonCardVolunteerState createState() => _PersonCardVolunteerState();
}

class _PersonCardVolunteerState extends State<PersonCardVolunteer> {
  final double speed = 1.4; // m/s -- average speed when walking
  final FirestoreService _service = new FirestoreService();
  FirebaseUser _user;
  VulnerablePerson vulnerablePerson;
  var distance;
  String unit;
  String time;
  double timeDouble;
  String timeUnit;
  String timeUnitSecond;
  String timeSecond = null;
  List<Products> products_shop = List<Products>();
  Heuristics heuristics;


  void _getVulnerablePerson() async {
    vulnerablePerson = await _service.getVulnerable(widget.orders.person_uid);
    setState(() {});
  }

  Future<void> getUser() async {
    _user = await FirebaseAuth.instance.currentUser();
  }

  @override
  void initState() {
    super.initState();
    heuristics = Heuristics(order: widget.orders);
    getUser();
    _getVulnerablePerson();
    _calculateDistance();
  }

  Future<void> _calculateDistance() async {
    var dist = await Geolocator().distanceBetween(
        double.parse(widget.latitude),
        double.parse(widget.longitude),
        widget.orders.latitude,
        widget.orders.longitude);
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

  Future<void> getProds(String uid) async {
    var documents = await FirestoreService().getProducts(uid);
    products_shop = documents.documents.map((e) => Products.fromJson(e.data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
                child: SvgPicture.asset(
                  user,
                  height: 50,
                  width: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vulnerablePerson == null
                          ? ''
                          : vulnerablePerson.first_name +
                              ' ' +
                              vulnerablePerson.last_name,
                      style: eTitle,
                    ),
                    Text(
                      heuristics.calculateScore().toString(),
                      // 'Se afla la ' +
                      //     distance.toString() +
                      //     ' ' +
                      //     unit.toString() +
                      //     ' de tine',
                      style: eWelcome,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 15.0, 8.0),
                child: IconButton(
                  onPressed: () {
                    _showDialog();
                  },
                  icon: new Icon(
                    Icons.info_outline,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    slideDialog.showSlideDialog(
      context: context,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: SvgPicture.asset(
                    user,
                    height: 50,
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    vulnerablePerson == null
                        ? ''
                        : vulnerablePerson.first_name +
                            ' ' +
                            vulnerablePerson.last_name,
                    style: eTitle,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 15.0, 10.0, 5.0),
                  child: Text(
                    'Persoana se afla la ' +
                        distance.toString() +
                        ' ' +
                        unit.toString() +
                        ' de tine',
                    style: eWelcome,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 5.0),
                    child: Text(
                      widget.orders.address,
                      style: eWelcome,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 5.0),
                    child: Text(
                      'Persoana a comandat 25 de produse',
                      style: eWelcome,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 25.0),
                    child: Text(
                      'Durata aproximativa a calatoriei: ' +
                          time +
                          ' ' +
                          timeUnit +
                          (timeSecond != null
                              ? (' si ' + timeSecond + ' min')
                              : ''),
                      style: eWelcome,
                    )),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () async {
                      if (volunteer_orders == null || volunteer_orders.isEmpty) {
                        Map<String, dynamic> data = widget.orders.toJson();
                        data['volunteer_uid'] = _user.uid;
                        data['type'] = "vendor";
                        volunteer_orders = data;
                        await Firestore.instance.collection('orders').document(widget.orders.uid).setData(data);
                      }
                    },
                    color: AppTheme.lightAccent,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 2.0, 50.0, 2.0),
                      child: Text(
                        'ACCEPTA',
                        style: eAcceptButton,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                      child: Text(
                        'SUNA',
                        style: eDeclineButton,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

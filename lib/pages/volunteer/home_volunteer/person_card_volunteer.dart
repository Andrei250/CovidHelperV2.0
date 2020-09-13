import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
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
  VulnerablePerson vulnerablePerson;
  var distance;
  String unit;
  String time;
  double timeDouble;
  String timeUnit;
  String timeUnitSecond;
  String timeSecond = null;
  List<Products> products_shop = List<Products>();


  void _getVulnerablePerson() async {
    vulnerablePerson = await _service.getVulnerable(widget.orders.person_uid);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
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
                      'Se afla la ' +
                          distance.toString() +
                          ' ' +
                          unit.toString() +
                          ' de tine',
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
                      String shop_uid = "j0anv0qmcOSNMzfzZ56q9yyctef2";
                      double lat = 45.02355;
                      double long = 23.2717983;
                      String shop_address = 'Strada 23 August 65, Târgu Jiu 210006, Romania';

                      await getProds(shop_uid).then((value) async {
                        Map<String, dynamic> data = widget.orders.toJson();

                        products_shop.forEach((element) {
                          if (widget.orders.products.containsKey(element.name)) {
                            if (int.parse(element.stock) == widget.orders.products[element.name]) {
                              widget.orders.products.remove(element.name);
                              products_shop.removeAt(products_shop.indexOf(element));
                            } else if (int.parse(element.stock) < widget.orders.products[element.name]) {
                              widget.orders.products[element.name] = (widget.orders.products[element.name] - int.parse(element.stock));
                              products_shop[products_shop.indexOf(element)].stock = '0';
                            } else {
                              products_shop[products_shop.indexOf(element)].stock = (int.parse(element.stock) - widget.orders.products[element.name]).toString();
                              widget.orders.products.remove(element.name);
                            }
                          }
                        });

                        products_shop.forEach((element) async {
                          if (int.parse(element.stock) > 0) {
                            await Firestore.instance
                                .collection('vendor')
                                .document(shop_uid)
                                .collection('Products')
                                .document(element.name)
                                .setData(element.toJson());
                          } else {
                            await Firestore.instance
                                .collection('vendor')
                                .document(shop_uid)
                                .collection('Products')
                                .document(element.name)
                                .delete();
                          }
                        });

                        data['type'] = "processing";

                        await Firestore.instance.collection('orders').document(widget.orders.uid).setData(data);

                        if (widget.orders.products.length != 0) {
                            data = widget.orders.toJson();
                            data['type'] = "queue";
                            await Firestore.instance.collection('orders').add(
                                data);
                        }

                      });
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
                        'REFUZA',
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

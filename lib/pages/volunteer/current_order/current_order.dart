import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:covidhelper_v2/utils/volunteer_orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentOrder extends StatefulWidget {
  @override
  _CurrentOrderState createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  bool _visibility = true;
  VulnerablePerson vulnerable;
  Vendor _vendor;
  int _index = 1;

  Future<void> getVulnerable() async {
    if (volunteer_orders != null && volunteer_orders.isNotEmpty) {
      vulnerable = await FirestoreService().getVulnerable(volunteer_orders['person_uid']);
    }
  }

  Future<void> getVendor() async {
    if (volunteer_orders != null && volunteer_orders.isNotEmpty) {
      _vendor = await FirestoreService().getOrderVendor(volunteer_orders['vendor_uid']);
    }
  }

  Future<void> initValues() async {
    if (volunteer_orders == null || volunteer_orders.isEmpty) {
      _index = 1;
    } else {
      if (volunteer_orders['type'] == 'vendor') {
        _index = 2;
      } else if (volunteer_orders['type'] == 'volunteer') {
        _visibility = true;
        _index = 3;
      }

      await getVulnerable();
      await getVendor();
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initValues();
  }

  @override
  Widget build(BuildContext context) {
    String vulnerable_name = vulnerable != null ? vulnerable.first_name + '' + vulnerable.last_name : "";
    String vulnerable_adress = vulnerable != null ? vulnerable.address : '';
    String vulnerable_phone =  vulnerable != null ? vulnerable.phone : '';

    String vendor_name = _vendor != null ? _vendor.name : "";
    String vendor_adress = _vendor != null ? _vendor.address : '';
    String vendor_phone =  _vendor != null ? _vendor.phoneNumber : '';

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
            child: Center(
                child: Text(
              'Comanda in curs',
              style: eTitle,
            )),
          ),
          elevation: 0,
        ),
        body: ListView(children: [

          Visibility(
            visible: _index == 1 ? true : false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Nu ai nicio comanda in desfasurare',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: eName
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          Visibility(
            visible: _index == 2 ? true : false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aveti o comanda in desfaturare.',
                              style: eName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4
                            ),
                            Text(
                              'Trebuie sa asteptati sa fiti contactat de magazin.',
                              style: eName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),


          Visibility(
              visible: _index == 3 ? _visibility : false,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  vendor,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Numele magazinului', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '$vendor_name',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  phone,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Telefon', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '$vendor_phone',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  location,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Adresa', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '$vendor_adress',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  distance,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Distanta', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '15 km',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  clock,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Durata', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '15 ani',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      grocery,
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('Produse', style: eName),
                                  ],
                                ),
                                FlatButton(
                                  color: AppTheme.lightAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Text(
                                    'Vezi lista',
                                    style: eButton,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '30 de produse',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          color: AppTheme.lightAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            'Arata persoana',
                            style: eButton,
                          ),
                          onPressed: () {
                            setState(() {
                              _visibility = !_visibility;
                            });
                          },
                        ),
                        FlatButton(
                          color: AppTheme.lightAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            'Finalizeaza comanda',
                            style: eButton,
                          ),
                          onPressed: () {
                            setState(() {
                              _visibility = !_visibility;
                            });
                          },
                        ),
                      ]),
                )
              ])),
          Visibility(
              visible:  _index == 3 ? !_visibility : false,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  user,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Numele',
                                    style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                vulnerable_name,
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  phone,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Telefon', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                vulnerable_phone,
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  location,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Adresa', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '$vulnerable_adress',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  distance,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Distanta', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '500 m',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  clock,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Durata', style: eName),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '15 minute',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      grocery,
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('Produse', style: eName),
                                  ],
                                ),
                                FlatButton(
                                  color: AppTheme.lightAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Text(
                                    'Vezi lista',
                                    style: eButton,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: Text(
                                '30 de produse',
                                style: eTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          color: AppTheme.lightAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            'Arata magazinul',
                            style: eButton,
                          ),
                          onPressed: () {
                            setState(() {
                              _visibility = !_visibility;
                            });
                          },
                        ),
                        FlatButton(
                          color: AppTheme.lightAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            'Finalizeaza comanda',
                            style: eButton,
                          ),
                          onPressed: () {
                            setState(() {
                              _visibility = !_visibility;
                            });
                          },
                        ),
                      ]),
                )
              ]))
        ]));
  }
}

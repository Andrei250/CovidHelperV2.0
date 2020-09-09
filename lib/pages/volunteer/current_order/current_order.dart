import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentOrder extends StatefulWidget {
  @override
  _CurrentOrderState createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  bool _visibility = true;
  VulnerablePerson vulnerable = new VulnerablePerson(
      first_name: 'Ion',
      last_name: 'Basfa',
      email: 'a@a.a',
      address: 'a',
      phone: '0123123123');

  @override
  Widget build(BuildContext context) {
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
              visible: _visibility,
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
                                'La Colt',
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
                                '0712312312',
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
                                'Strada Turtelor Dulci din Padurea Bantuita din Clujul Constantean',
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
                            'Am ridicat produsele',
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
              visible: !_visibility,
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
                                vulnerable.first_name +
                                    ' ' +
                                    vulnerable.last_name,
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
                                vulnerable.phone,
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
                                vulnerable.address,
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

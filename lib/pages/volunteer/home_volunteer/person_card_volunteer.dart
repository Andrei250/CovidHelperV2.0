import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
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
  final FirestoreService _service = new FirestoreService();
  VulnerablePerson vulnerablePerson;
  double distance;

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
    final double dist = await Geolocator().distanceBetween(
        double.parse(widget.latitude),
        double.parse(widget.longitude),
        widget.orders.latitude,
        widget.orders.longitude);
    distance = dist;
    print('00000000000000000000');
    print(dist);
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
                      'Se afla la ' + distance.toString() + ' de tine',
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
                    'Persoana se afla la ' + distance.toString() + ' de tine',
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
                      'Durata aproximativa a calatoriei: 50 de minute',
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
                    onPressed: () {},
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/models/orders.dart';
import 'package:covidhelper_v2/routes.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:url_launcher/url_launcher.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';

class VendorComingVolunteer extends StatefulWidget {
  VendorComingVolunteer({this.name, this.phonenumber, this.order});

  final String name;
  final String phonenumber;
  Orders order;


  @override
  _VendorComingVolunteerState createState() => _VendorComingVolunteerState();
}

class _VendorComingVolunteerState extends State<VendorComingVolunteer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SvgPicture.asset(
                    user,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.name,
                  style: eTitle,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
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
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    launch('tel://'+widget.phonenumber);
                  },
                  color: AppTheme.lightAccent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                    child: Text(
                      'CHEAMA VOLUNTARUL',
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
                  onPressed: () {
                    launch('tel://'+widget.phonenumber);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
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
                  child:SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SvgPicture.asset(
                      user,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.name,
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
                    'Persoana se afla la 15km de tine',
                    style: eWelcome,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 5.0),
                    child: Text(
                      'Strada Luncilor, Nr 7',
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
                    onPressed: () { launch('tel://'+widget.phonenumber);},
                    color: AppTheme.lightAccent,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 2.0, 50.0, 2.0),
                      child: Text(
                        'SUNA',
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
                    onPressed: () {
                    },
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
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onPressed: () {},
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(75.0, 2.0, 75.0, 2.0),
                  child: Text(
                    'REFUZA COMANDA',
                    style: eAcceptButton,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }



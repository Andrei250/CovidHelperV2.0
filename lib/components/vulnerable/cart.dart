import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/components/vulnerable/card_for_product.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/shopping_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShoppingCart extends StatefulWidget {
  Map data;

  ShoppingCart({this.data});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Widget> list_of_meds = List<Widget>();
  List<Widget> list_of_prods = List<Widget>();
  FirebaseUser user;
  DocumentReference userInfo;

  Future<void> getData() async {
    user = await FirebaseAuth.instance.currentUser();
    userInfo = await Firestore.instance.collection('Vulnerables').document(user.uid);
  }

  @override
  void initState() {
    super.initState();
    meds.forEach((key, value) {
      Products prod = Products(name: key, stock: value.toString(), price: "0");
      prod.isShop = false;

      list_of_meds.add(
        CardForProduct(
          product: prod,
          isCart: true,
        )
      );
    });

    prods.forEach((key, value) {
      Products prod = Products(name: key, stock: value.toString(), price: "0");
      prod.isShop = true;

      list_of_prods.add(
          CardForProduct(
            product: prod,
            isCart: true,
          )
      );
    });

  }

  AppBar interfaceAppBar() {
    return AppBar(
      elevation:0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back_arrow.svg",
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Covidhelper',
            style: eTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                child: Center(
                    child: Text(
                      's',
//                          child: Text(getInitials(widget.name),
                      style: eStreet,
                    )),
                decoration: new BoxDecoration(
                  color: AppTheme.lightAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = interfaceAppBar();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        children: [
          Column(
            children: list_of_prods,
          ),
          Column(
            children: list_of_meds,
          ),
          Divider(
            height: 20.0,
            thickness: 0,
          ),
          if (meds.length > 0 || prods.length > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    prods.clear();
                    meds.clear();
                    if (widget.data['func'] != null) {
                      widget.data['func']();
                    }
                    Navigator.of(context).pop();
                  },
                  color: Colors.redAccent,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50.0, 2.0, 50.0, 2.0),
                    child: Text(
                      'Sterge tot',
                      style: eAcceptButton,
                    ),
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () async {
                    await getData().then((value) {
                      var retrieved_data;

                      userInfo.get().then((
                          DocumentSnapshot datasnapshot) async {
                        if (datasnapshot.exists) {
                          retrieved_data = datasnapshot.data;
                        }

                        VulnerablePerson person = VulnerablePerson().fromStream(
                            retrieved_data);
                        Map<String, dynamic> data = Map<String, dynamic>();
                        data['address'] = person.address;
                        data['person_uid'] = user.uid;
                        data['is_med'] = true;
                        data['products'] = meds;
                        data['type'] = "queue";
                        meds.clear();

                        if (meds.length > 0) {
                          await Firestore.instance.collection('orders').add(
                              data);
                        }

                        data['is_med'] = false;
                        data['products'] = prods;
                        prods.clear();

                        if (prods.length > 0) {
                          await Firestore.instance.collection('orders').add(
                              data);
                        }

                        if (widget.data['func'] != null) {
                          widget.data['func']();
                        }
                        Navigator.of(context).pop();
                      });
                    });
                  },
                  color: AppTheme.lightAccent,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50.0, 2.0, 50.0, 2.0),
                    child: Text(
                      'Comanda',
                      style: eAcceptButton,
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}

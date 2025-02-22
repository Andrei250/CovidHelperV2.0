import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidhelper_v2/components/vulnerable/list_products.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/models/vulnerable_person.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class GetProducts extends StatefulWidget {
  @override
  _GetProductsState createState() => _GetProductsState();
}

class _GetProductsState extends State<GetProducts> {

  void resetBuild() {
    setState(() {

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
              Container(
                width: 40.0,
                height: 40.0,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/vulnerable_main/shopping_cart', arguments: {"func": resetBuild});
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppBar appBar = interfaceAppBar();
    return MultiProvider(
      providers: [
        StreamProvider<List<Vendor>>.value(value: FirestoreService().vendors),
      ],
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: appBar,
        body: Column(
          children: [
            ListProducts(size: size, appbar: appBar),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

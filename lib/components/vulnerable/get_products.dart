import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<List<Products>> products;

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
                    onPressed: () {},
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
    return MultiProvider(
      providers: [
        StreamProvider<List<List<Products>>>.value(value: FirestoreService().products),
      ],
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: interfaceAppBar(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.grey.withOpacity(0.23),
                    )
                  ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Cauta produse",
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.5)
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
            Builder(
              builder: (BuildContext context) {
                products = Provider.of<List<List<Products>>>(context);
                List<Products> newList = new List<Products>();

                products.forEach((element) {
                  element.forEach((element) {
                    if (!newList.contains(element)) {
                      newList.add(element);
                    }
                  });
                });

                return Expanded(
                  child: SizedBox(
                    height: size.height - 54,
                    child: ListView.builder(
                      itemCount: newList.length,
                      itemBuilder: (context, index) {
                        return Text("DA");
                      },
                    ),
                  ),
                );
              }
            ),
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

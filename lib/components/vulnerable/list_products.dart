import 'package:covidhelper_v2/components/vulnerable/card_for_product.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ListProducts extends StatefulWidget {
  AppBar appbar;
  Size size;

  ListProducts({this.size, this.appbar});

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  List<Products> products = List<Products>();
  List<Products> filtered_products = List<Products>();
  List<Vendor> vendors;
  List<List<Products>> list_of_lists = List<List<Products>>();
  List<Widget> widgets_list = List<Widget>();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    products = List<Products>();
    filtered_products = List<Products>();
    list_of_lists = List<List<Products>>();
    widgets_list = List<Widget>();
  }

  @override
  Widget build(BuildContext context) {
    vendors = Provider.of<List<Vendor>>(context);
    if(vendors != null) {
      vendors.forEach((element) {
        final elements = FirestoreService().getProductsStream(element.uid);
        if (elements != null) {
          elements.forEach((element) {
            if (element.length > 0) {
              element.forEach((el) {
                bool exists = false;

                if (products != null) {
                  products.forEach((element) {
                    if (element.name == el.name) {
                      exists = true;
                      element.stock = int.parse(element.stock) > int.parse(el.stock) ? element.stock.toString() : el.stock.toString();
                    }
                  });
                }

                if (exists == false) {
                  products.add(el);
                  if (_currentIndex < vendors.length) {
                    setState(() {
                      _currentIndex ++;
                      filtered_products = products;
                    });
                  }
                }
              });
            }
          });
        }
      });
    }

    return Column(
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
                  color: Colors.white,
                )
              ]
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      filtered_products = products.where((element) =>
                      (element.name.toLowerCase().contains(value.toLowerCase()))
                      ).toList();
                    });
                  },
                  style: TextStyle(color: Colors.black),
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
        Divider(
          thickness: 2,
        ),
        SizedBox(
          height: widget.size.height - widget.appbar.preferredSize.height - 120,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: filtered_products.length,
                  itemBuilder: (context, index) =>  CardForProduct(product: filtered_products[index]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

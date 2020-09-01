import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ListProducts extends StatefulWidget {
  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  List<Products> products = List<Products>();
  List<Vendor> vendors;
  List<List<Products>> list_of_lists = List<List<Products>>();
  List<Widget> widgets_list = List<Widget>();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    products = List<Products>();
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
                    if (element.name == el.name && element.price == el.price) {
                      exists = true;
                      element.stock = element.stock + el.stock;
                    }
                  });
                }

                if (exists == false) {
                  products.add(el);
                  if (_currentIndex == 0) {
                    setState(() {
                      _currentIndex = 1;
                    });
                  }
                }
              });
            }
          });
        }
      });

    }

    return ListView(
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) =>  Text(products[index].name),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

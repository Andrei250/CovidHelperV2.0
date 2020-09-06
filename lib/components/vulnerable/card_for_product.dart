import 'package:covidhelper_v2/components/navigation/feedback.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:covidhelper_v2/utils/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class CardForProduct extends StatefulWidget {
  Products product;
  bool isCart;

  CardForProduct({this.product, this.isCart});

  @override
  _CardForProductState createState() => _CardForProductState();
}

class _CardForProductState extends State<CardForProduct> {
  String textProduct;
  int value = 0;
  int stockValue;

  void initialize() {
    stockValue = int.parse(widget.product.stock);

    if (widget.product.isShop == true) {
      if (prods[widget.product.name] != null) {
        value = prods[widget.product.name];
      } else {
        value = 0;
      }
    } else {
      if (meds[widget.product.name] != null) {
        value = meds[widget.product.name];
      } else {
        value = 0;
      }
    }


    if (widget.isCart != null) {
      textProduct = "Ai selectat " + '$value' + " produse";
    } else if (stockValue <= 50) {
      textProduct = 'Mai sunt ' + '$stockValue' + ' de produse';
    } else if (stockValue == 0) {
      textProduct = "Nu mai sunt produse";
    } else {
      textProduct = "In Stoc";
    }
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initialize();
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
                    widget.product.isShop == true ? food : pill,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: eTitle,
                    ),
                    Text(
                      textProduct,
                      style: eWelcome,
                    ),
                  ],
                ),
              ),
              Spacer(),
              if (widget.isCart == null || widget.isCart == false)
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          value ++;
                          value = value > stockValue ? stockValue : value;
                          if (widget.product.isShop == true) {
                            prods[widget.product.name] = value;
                          } else {
                            meds[widget.product.name] = value;
                          }
                        });
                      },
                      icon: Icon(Icons.add, color: Colors.black,),
                    ),

                    Text('$value',
                      style: new TextStyle(fontSize: 16.0)
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          value --;
                          value = value < 0 ? 0 : value;
                          if (value != 0) {
                            if (widget.product.isShop == true) {
                              prods[widget.product.name] = value;
                            } else {
                              meds[widget.product.name] = value;
                            }
                          } else {
                            if (widget.product.isShop == true) {
                              prods.remove(widget.product.name);
                            } else {
                              meds.remove(widget.product.name);
                            }
                          }
                        });
                      },
                      icon: Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

}

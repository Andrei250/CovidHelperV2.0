import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class ProductCard extends StatefulWidget {
  ProductCard({this.product});

  Products product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
                      'Mai sunt ' + widget.product.stock + ' de produse in stoc',
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
                  child: SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: SvgPicture.asset(
                      widget.product.isShop == true ? food : pill,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.name,
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
                    'Mai sunt X produse in stoc',
                    style: eWelcome,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 5.0),
                    child: Text(
                      'Ai vandut Y produse prin intermediul aplicatiei',
                      style: eWelcome,
                    )),
              ],
            ),
            Center(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onPressed: () {},
                color: AppTheme.lightAccent,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                  child: Text(
                    'ACTUALIZEAZA STOCUL',
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

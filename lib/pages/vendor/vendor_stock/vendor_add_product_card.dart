import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:validators/validators.dart' as validators;
import 'package:validators/sanitizers.dart' as sanitizers;
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';

class VendorAddProductCard extends StatefulWidget {
  VendorAddProductCard({this.name, this.category, this.categoryDoc});

  final String name;
  final String category;
  final String categoryDoc;

  @override
  _VendorAddProductCardState createState() => _VendorAddProductCardState();
}

class _VendorAddProductCardState extends State<VendorAddProductCard> {
  final _formKey = GlobalKey<FormState>();
  Products product = Products();
  VendorBack services = VendorBack();
  @override
  Widget build(BuildContext context) {


    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
                child: Icon(
                  Icons.fastfood,
                  color: AppTheme.lightAccent,
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.name,
                  style: eProduct,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 14.0, 0.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      services.addStock(widget.categoryDoc, widget.category, widget.name, product.stock, product.price);
                      services.addStockToProducts(widget.name, product.stock, product.price, true);
                    }
                  },
                  color: AppTheme.lightAccent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2.5, 2.0, 2.5, 2.0),
                    child: Text(
                      'Actualizeaza',
                      style: eAcceptButton,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.queue),
                    hintText: 'Introdu aici cantitatea de marfa in stoc',
                    labelText: 'Cantitate',
                  ),
                  validator: (String value){
                    if(!validators.isNumeric(value)){
                      return 'Introdu un numar';
                    }else{
                      //int stoc = int.tryParse(value);
                      product.stock = value;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.queue),
                    hintText: 'Introdu aici pretul pe o unitate',
                    labelText: 'Pret',
                  ),
                  validator: (String value){
                    if(!validators.isFloat(value)){
                      return 'Introdu un numar';
                    }else{
                      //double pret = double.tryParse(value);
                      product.price = value;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

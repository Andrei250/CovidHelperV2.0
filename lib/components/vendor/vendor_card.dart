import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;
  final Size size;

  VendorCard({this.vendor, this.size});

  @override
  Widget build(BuildContext context) {
    final double marginTop = size.width / 16;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: size.width / 40),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(top: marginTop),
                  height: size.width / 3,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
                        child: Text(
                          {vendor.name}.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'quicksand',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                        child: FlatButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          color: AppTheme.lightAccent,
                          child: Text(
                            'Exploreaza',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'quicksand',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: size.width / 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.width / 6),
                    child: Container(
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/vulnerables/vendor_img.png',
                        width: size.width / 6 ,
                        height: size.width / 6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

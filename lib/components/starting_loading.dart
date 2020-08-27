import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartingLoading extends StatelessWidget {
  double logoHeight = 50.0;
  double logoWidth = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 200.0),
                  SvgPicture.asset(
                    logo_one,
                    height: 150.0,
                    width: 150.0,
                    color: AppTheme.lightAccent,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Covidhelper',
                    style: eWelcomeName,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(
                    from,
                    height: logoHeight * 0.4,
                    width: logoWidth * 0.4,
                    color: AppTheme.lightAccent.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  SvgPicture.asset(
                    dotLoading,
                    height: logoHeight,
                    width: logoWidth,
                    color: AppTheme.lightAccent,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

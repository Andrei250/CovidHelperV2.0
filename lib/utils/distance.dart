import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_theme.dart';

class Distance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SvgPicture.asset(
        distance,
        color: AppTheme.lightColor,
        height: 120.0,
        width: 120.0,
      ),
    );
  }
}

import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_theme.dart';

class LogoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        logo_one,
        color: AppTheme.lightColor,
        height: 30.0,
        width: 30.0,
    );
  }
}

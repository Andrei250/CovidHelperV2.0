import 'package:covidhelper_v2/pages/vendor/vendor_home.dart';
import 'package:covidhelper_v2/routes.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

import 'pages/volunteer/home_volunteer/home.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
//      home: VulnerablesMain(),
      initialRoute: '/',
      onGenerateRoute: Routing.generateRoute,
));

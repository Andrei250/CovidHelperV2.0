import 'package:covidhelper_v2/pages/admin_panel.dart';
import 'package:covidhelper_v2/pages/loading.dart';
import 'package:covidhelper_v2/routes.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'pages/volunteer/home_volunteer/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Home(),
      // initialRoute: '/loading',
      // onGenerateRoute: Routing.generateRoute,
    ));

import 'package:covidhelper_v2/pages/notications/notifications.dart';
import 'package:covidhelper_v2/pages/statistics_volunteer/statistics.dart';
import 'package:covidhelper_v2/pages/statistics_volunteer/stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

import 'pages/volunteer/home_volunteer/home.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Notifications(),
//      initialRoute: '/vulnerable_main',
//      onGenerateRoute: Routing.generateRoute,
));

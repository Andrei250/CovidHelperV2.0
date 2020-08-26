import 'package:covidhelper_v2/pages/loading.dart';
import 'package:covidhelper_v2/routes.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'pages/register/register_all.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Loading(),
      initialRoute: '/',
      onGenerateRoute: Routing.generateRoute,
    ));

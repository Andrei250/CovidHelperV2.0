import 'package:covidhelper_v2/components/vulnerable/location.dart';
import 'package:covidhelper_v2/pages/admin_panel.dart';
import 'package:covidhelper_v2/pages/loading.dart';
import 'package:covidhelper_v2/pages/register/register_address.dart';
import 'package:covidhelper_v2/routes.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: RegisterAddress(),
      // initialRoute: '/loading',
      // onGenerateRoute: Routing.generateRoute,
    ));

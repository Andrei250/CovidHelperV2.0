import 'package:covidhelper_v2/components/change_name.dart';
import 'package:covidhelper_v2/components/loading_screen.dart';
import 'package:covidhelper_v2/pages/home.dart';
import 'package:covidhelper_v2/pages/home_screen.dart';
import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/pages/admin_panel.dart';
import 'package:covidhelper_v2/routes.dart';
import 'package:covidhelper_v2/pages/register/register_choose.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'components/change_password.dart';


void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
     // home: Home(),
      initialRoute: '/vendor_main',
      onGenerateRoute: Routing.generateRoute,
));



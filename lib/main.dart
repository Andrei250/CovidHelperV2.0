import 'package:covidhelper_v2/components/loading_screen.dart';
import 'package:covidhelper_v2/pages/register/new_loaging.dart';
import 'package:covidhelper_v2/pages/register/register_email.dart';
import 'package:covidhelper_v2/pages/register/register_pages.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_home.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

import 'pages/register/register_all.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Register(),
));

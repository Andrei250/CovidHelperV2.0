import 'package:covidhelper_v2/pages/register/register_pages.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: RegisterPages(),
));

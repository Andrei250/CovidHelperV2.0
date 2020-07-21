import 'package:covidhelper_v2/pages/AdminPanel.dart';
import 'package:covidhelper_v2/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/pages/register_email.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'components/ListUsers.dart';

void main() => runApp(MaterialApp(
    theme: AppTheme.darkTheme,
  home: RegisterEmail()
));


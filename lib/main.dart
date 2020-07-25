import 'package:covidhelper_v2/pages/register/register_email.dart';
import 'package:covidhelper_v2/pages/register/register_name.dart';
import 'package:covidhelper_v2/pages/register/register_password.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

import 'components/list_users.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: AppTheme.darkTheme,
  home: RegisterPassword(),
));

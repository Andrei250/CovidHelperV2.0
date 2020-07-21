import 'package:covidhelper_v2/pages/admin_panel.dart';
import 'package:covidhelper_v2/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/pages/register_email.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

import 'components/list_users.dart';

void main() => runApp(MaterialApp(
    theme: AppTheme.darkTheme,
  home: AdminPanel(),
));

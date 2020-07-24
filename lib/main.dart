import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/pages/admin_panel.dart';
import 'package:covidhelper_v2/pages/login.dart';
import 'package:covidhelper_v2/pages/register_all.dart';
import 'package:covidhelper_v2/pages/register_email.dart';
import 'package:covidhelper_v2/pages/register_name.dart';
import 'package:covidhelper_v2/pages/register_password.dart';
import 'package:covidhelper_v2/pages/register_phone.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/pages/register_one_text.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

import 'components/list_users.dart';

void main() => runApp(MaterialApp(


    theme: ThemeData.dark(),
  home: RegisterPassword()
));



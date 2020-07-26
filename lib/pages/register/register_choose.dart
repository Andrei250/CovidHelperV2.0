import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_register.dart';
import 'package:flutter/material.dart';

class RegisterChoose extends StatefulWidget {
  @override
  _RegisterChooseState createState() => _RegisterChooseState();
}

class _RegisterChooseState extends State<RegisterChoose> {
  String name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RegisterAll.generateRoute,
      theme: AppTheme.darkTheme,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                    width: 60.0,
                    child: LogoRegister(),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
                    child: Text('Alegeti tipul de cont',
                        style: AppTheme.darkTheme.textTheme.headline2),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    child: FlatButton(
                        color: AppTheme.lightColor,
                        child: Text(
                          'Vreau sa imi inscriu magazinul',
                          style: eButton,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register_name',
                              arguments: 'vendor');
                        }),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    child: FlatButton(
                        color: AppTheme.lightColor,
                        child: Text('Vreau sa ma inscriu ca voluntar',
                            style: eButton),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register_name',
                              arguments: 'volunteer');
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

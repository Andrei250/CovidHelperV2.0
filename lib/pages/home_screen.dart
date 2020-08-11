import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
//        theme: AppTheme.darkTheme,
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                //  TODO change the color of the app bar ? or not
                backgroundColor: Color.fromRGBO(0, 200, 150, 1),
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Container(height: 30, width: 30, child: LogoAppBar()),
                    ),
                    Text(
                      'Covidhelper',
                      style: AppTheme.darkTheme.textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ),
            body: ListView(children: <Widget>[
              ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.elliptical(510.0, 100.0)),
                child: Container(
                  height: 200,
                  color: AppTheme.lightAccent,
                  child: Center(
                      child: Text(
                    'Ai ajutat 35 de persoane',
                    style: AppTheme.darkTheme.textTheme.headline2,
                  )),
                ),
              ),
            ])));
  }
}

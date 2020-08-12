import 'package:covidhelper_v2/components/statistics_square.dart';
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(510.0, 100.0)),
                child: Container(
                  height: 200,
                  color: AppTheme.lightAccent,
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Icon(
                          Icons.person,
                          color: AppTheme.lightColor,
                          size: 100.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Esti pe locul 2 in topul voluntarilor',
                          style: AppTheme.darkTheme.textTheme.headline3,
                        ),
                      )
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatisticsSquare(
                        description: 'Ai acoperit',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatisticsSquare(
                        description: 'Ai ajutat',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatisticsSquare(
                        description: 'da',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatisticsSquare(
                        description: 'da',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Vezi statistici'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80.0,
                      width: 392.0,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: AppTheme.lightAccent,
                          child: Text(
                            'Ajuta o persoana',
                            style: eStatsTextValue,
                          ),
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ])));
  }
}

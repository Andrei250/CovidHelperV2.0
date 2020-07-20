import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Scaffold(
        body:
        Container(
//          color: AppTheme.accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
//                padding: const EdgeInsets.all(20.0),
                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 150.0,
                    ),
                    Text('Creeaza un cont nou',
                        style: AppTheme.darkTheme.textTheme.headline2),
                    Text('Indrodu adresa de email',
                        style: AppTheme.darkTheme.textTheme.headline3),
                    SizedBox(
                      height: 100.0,
                    ),
                    SizedBox(
                      width: 350,
                      child: new TextFormField(
                        style: AppTheme.darkTheme.textTheme.subtitle1,
                        cursorColor: AppTheme.lightColor,
                        decoration: new InputDecoration(
                          labelText: "Email",
                        ),
                        //fillColor: Colors.green
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

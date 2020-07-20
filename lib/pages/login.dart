import 'package:flutter/material.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.darkTheme,
        home: Scaffold(
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 32),
                    child: Text(
                      'Conecteaza-te',
                      style: TextStyle(
                        fontFamily: 'quicksand',
                        color: AppTheme.lightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      )
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Text(
                          'Email',
                          style: eLabel,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: LBoxDecoration,
                        height: 60.0,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: AppTheme.darkTheme.textTheme.subtitle1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: 'Introdu adresa ta de email',
                            hintStyle: eHintText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Text(
                          'Parola',
                          style: eLabel,
                        ),
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: LBoxDecoration,
                        height: 60.0,
                        child: TextField(
                          obscureText: true,
                          style:  AppTheme.darkTheme.textTheme.subtitle1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Introdu parola ta',
                            hintStyle: eHintText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => print('Ai uitat parola......'),
                      padding: EdgeInsets.only(right: 0.0),
                      child: Text(
                        'Ai uitat parola?',
                        style: eLabel,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () => print('Testtttttttprint'),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'quicksand',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:covidhelper_v2/pages/register/register_all.dart';
import 'package:covidhelper_v2/routes.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterChoose extends StatefulWidget {
  RegisterChoose({this.onButtonPressed});

  final VoidCallback onButtonPressed;

  @override
  _RegisterChooseState createState() => _RegisterChooseState();
}

class _RegisterChooseState extends State<RegisterChoose> {
  String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // app bar with size 1px to deal with the notches
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                logo_one,
                color: AppTheme.lightAccent,
                height: 150.0,
                width: 150.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mute persoane au nevoie de tine.', style: eTitle),
                    Text('Cum crezi ca le poti ajuta?', style: eTitle),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: FlatButton(
                        color: AppTheme.lightAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text(
                          'Cu produse din magazinul meu',
                          style: eButton,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register_email',
                              arguments: 'vendor');
                        }),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: FlatButton(
                        color: AppTheme.lightAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text('Livrand produse, ca voluntar',
                            style: eButton),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register_email',
                              arguments: 'volunteer');
                        }),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: FlatButton(
                        color: Colors.blue[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text('Am deja cont si vreau sa ma loghez',
                            style: eButton),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}

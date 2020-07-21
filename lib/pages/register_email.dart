import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//const logo = 'assets/images/logos/logo_white.svg';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(onOnFocusNodeEvent);
  }

  onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Scaffold(
        floatingActionButton: new RaisedButton(
            onPressed: () {},
            child: Text('Next')),
        body: Container(
//          color: AppTheme.accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
//                padding: const EdgeInsets.all(20.0),
                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 20.0),
                      child: SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: SvgPicture.asset(
                          logo_one,
                          color: AppTheme.lightColor,
                          height: 70.0,
                          width: 70.0,
                        ),
                      ),
                    ),
                    Text('Creeaza un cont nou',
                        style: AppTheme.darkTheme.textTheme.headline2),
                    Text('Indrodu adresa de email',
                        style: AppTheme.darkTheme.textTheme.headline3),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: 320,
                      child: new TextFormField(
                        focusNode: focusNode,
                        style: AppTheme.darkTheme.textTheme.subtitle1,
                        cursorColor: AppTheme.lightColor,
                        decoration: new InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              focusNode.hasFocus ? eLabelFocused : eLabel,
                        ),
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

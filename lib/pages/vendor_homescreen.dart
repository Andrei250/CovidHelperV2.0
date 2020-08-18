import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/logo_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slider_button/slider_button.dart';

class vendorHomeScreen extends StatefulWidget {
  @override
  _vendorHomeScreenState createState() => _vendorHomeScreenState();
}

class _vendorHomeScreenState extends State<vendorHomeScreen> {
  /* createAlertDialog(BuildContext context){

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Sunteti sigur ca doriti sa inchideti magazinul?"),
        content: TextField(
          controller: customController,
        ),
        actions: [
          MaterialButton(
            elevation: 5.0,
            child: Text('pfff'),
            onPressed: (){
              Navigator.of(context).pop(customController.text.toString());
            },
          ),
          Center(child: SliderButton(

                    action: () {
                      Navigator.of(context).pop(customController.text.toString());
                    },
                    label: Text(
                        "Gliseaza pentru a inchide!",
                        style: TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                        ),
                    ),
                    icon: Text(
                      "x",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 44,
                      ),
                    ),
                  )
                )
           ],
        );
      }
    );
  }*/

  _confirmResult(bool isYes, BuildContext context) {
    if (isYes) {
      print('inchide');
      Navigator.pop(context);
    } else {
      print('asteapta');
      Navigator.pop(context);
    }
  }

  confirm(BuildContext context, String title, String description) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                Text(description,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ))
              ],
            )),
            actions: [
              RaisedButton(
                padding: EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () => _confirmResult(false, context),
                child: Text('Nu'),
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () => _confirmResult(true, context),
                child: Text('Da'),
                color: Colors.red,
                textColor: Colors.white,
              )
            ],
            elevation: 24.0,
          );
        });
  }

  addProduct(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('mor'),
              content: SingleChildScrollView(
                  child: ListBody(
                children: [
                  Text('mama ta de cod',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      )),
                  DropdownButton<String>(
                    items: <String>['dsadasas', 'sadadas', 'dsadsaas', 'dsadas'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )
                ],
              )));
        });
  }

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
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(510.0, 100.0)),
                child: Container(
                    height: 200,
                    color: AppTheme.lightAccent,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                            child: Text(
                          'La Doi Pasi ',
                          style: AppTheme.darkTheme.textTheme.headline1,
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          'Ai efectuat X comenzi ',
                          style: AppTheme.darkTheme.textTheme.headline2,
                        )),
                      ],
                    )),
              ),
              SizedBox(
                height: 15.0,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: false,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: AppTheme.lightAccent,
                  textColor: AppTheme.lightColor,
                  onPressed: () {
                    addProduct(context);
                  },
                  child: Text(
                    'Adauga un produs',
                    style: TextStyle(
                      color: AppTheme.lightColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.red,
                  textColor: AppTheme.lightColor,
                  onPressed: () {
                    confirm(
                        context,
                        'Esti sigur ca doresti sa inchizi magazinul?',
                        'Magazinul tau se va redeschide automat conform programului setat in aplicatie.');
                  },
                  child: Text(
                    'Inchide Magazinul',
                    style: TextStyle(
                      color: AppTheme.lightColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ])));
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 80),
                          child: Center(
                            child: Text(
                              'Statistica numarul : ${imgList.indexOf(item) + 1} ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

final List<String> imgList = [
  'https://images.unsplash.com/photo-1523187747149-de89503385ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
  'https://images.pexels.com/photos/4393426/pexels-photo-4393426.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  'https://images.pexels.com/photos/255379/pexels-photo-255379.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  'https://images.pexels.com/photos/3791664/pexels-photo-3791664.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
];

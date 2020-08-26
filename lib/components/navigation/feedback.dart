import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';


class PersonFeedback extends StatefulWidget {
  final Map data;

  PersonFeedback({this.data});

  @override
  _PersonFeedbackState createState() => _PersonFeedbackState();
}

AppBar interfaceAppBar(BuildContext context) {
  return AppBar(
    elevation:0,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: SvgPicture.asset(
        "assets/icons/back_arrow.svg",
        color: Colors.black,
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Covidhelper',
          style: eTitle,
        ),
        Container(
          width: 40.0,
          height: 40.0,
          child: Center(
              child: Text(
                's',
//                          child: Text(getInitials(widget.name),
                style: eStreet,
              )),
          decoration: new BoxDecoration(
            color: AppTheme.lightAccent,
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}

class _PersonFeedbackState extends State<PersonFeedback> {
  String emptyness_error = '';
  TextEditingController customController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: interfaceAppBar(widget.data['context']),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: size.height * 0.2,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.2 - 27,
                      decoration: BoxDecoration(
                        color: AppTheme.lightAccent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: size.width * 0.1),
                                child: Text(
                                  "Feedback",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: AppTheme.darkTheme.textTheme.headline2,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: size.width * 0.1),
                child: Container(
                  width: size.width - 0.2 * size.width,
                  child: Column(
                    children: [
                      TextField(
                        maxLines: 10,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Feedback',
                        ),
                        controller: customController,
                      ),

                      SizedBox(
                        height: 20,
                        width: 0.8 * size.width,
                        child: Text(
                          emptyness_error,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      RaisedButton(
                        onPressed: () async {
                          String value = customController.text.toString();
                          emptyness_error = '';

                          print(value);

                          if (value == null || value.length < 20  || value.trim().length < 20) {
                            emptyness_error = "Feedback-ul trebuie sa aiba minim 20 de caractere";
                            setState(() {

                            });
                          } else {
                            dynamic result = await FirestoreService().createFeedback(value);

                            if (result != null) {
                              Fluttertoast.showToast(
                                  msg: 'Multumim pentru feedback',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 3,
                                  backgroundColor: Colors.white60,
                                  textColor: Colors.black
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Eroare la conectarea bazei de date!',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 3,
                                  backgroundColor: Colors.white60,
                                  textColor: Colors.black
                              );
                            }
                          }

                        },
                        child: Text(
                          'Trimite feedback',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'quicksand',
                          ),
                        ),
                        color: AppTheme.lightAccent,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}

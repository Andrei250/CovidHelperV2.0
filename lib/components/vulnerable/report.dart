import 'package:covidhelper_v2/components/form_input.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final FirestoreService _service = new FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String full_name = '';
  String message = '';
  String choice = "Alege tipul";
  String behind_choice = '';
  String emptyness_error = '';

  void changeFullName(String val) {
    full_name = val;
  }

  void changeReportMessage(String val) {
    message = val;
  }

  void changeChoice(String val) {
    choice = val;
    behind_choice = val == "Livrator" ? 'volunteer' : 'vendor';
    setState(() {

    });
  }

  bool inputValidate() {
    if (message.isEmpty || full_name.isEmpty || behind_choice.isEmpty) {
      emptyness_error = 'Toate campurile sunt obligatorii';
      return false;
    }

    return true;
  }

  Future _getUser() async {
    await _auth.signInWithEmailAndPassword(email: "adm@adm.com", password: "123456");
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: size.height * 0.3,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.3 - 27,
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
                                "Raporteaza o persoana sau un magazin",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            choice,
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: DropdownButton<String>(
                            items: <String>['Livrator', 'Magazin'].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              changeChoice(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    FormInput(type: false,
                              label: "Numele complet al persoanei / magazinului",
                              changeValue: changeFullName,
                              theme: "light",
                              width: size.width * 0.8),
                    FormInput(type: false,
                              label: "Observatie",
                              changeValue: changeReportMessage,
                              theme: "light",
                              width: size.width * 0.8),

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
                          emptyness_error = '';
                          inputValidate();

                          if (emptyness_error == '') {
                              dynamic result = await _service.createReport(behind_choice, full_name, message);

                              if (result == null) {
                                emptyness_error = "Eroare la adaugarea report-ului";
                              } else {
                                emptyness_error = 'Report-ul a fost trimis';
                              }
                          }
                          setState(() {

                          });
                        },
                        child: Text(
                          'Trimite raport',
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
    );
  }
}

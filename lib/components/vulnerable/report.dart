import 'package:covidhelper_v2/components/form_input.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String full_name = '';

  void changeFullName(String val) {
    full_name = val;
  }

  @override
  void initState() {
    super.initState();
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
                        Container(
                          child: Text(
                            "Raporteaza o persoana sau un magazin",
                            style: AppTheme.darkTheme.textTheme.subtitle1,
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
            Column(
              children: [
                DropdownButton<String>(
                  items: <String>['Livrator', 'Magazin'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                FormInput(type: false, label: "Numele complet al persoanei / magazinului", changeValue: changeFullName),

              ],
            )
          ],
        ),
      ],
    );
  }
}

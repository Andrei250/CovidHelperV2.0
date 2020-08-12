import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NeedHelp extends StatefulWidget {
  @override
  _NeedHelpState createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
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
                      FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(
                              Icons.help,
                              size: 30,
                          ),
                          label: Text(
                              'Ajutor',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'quicksand',
                              ),
                          ),
                          color: Colors.red[400],
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      )
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.grey.withOpacity(0.23),
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Cauta magazin",
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.5)
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        SvgPicture.asset("assets/icons/search.svg"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

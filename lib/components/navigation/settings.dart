import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Settings extends StatefulWidget {
  final Map data;

  Settings({this.data});

  @override
  _SettingsState createState() => _SettingsState();
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

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: interfaceAppBar(widget.data['context']),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              'Setarile notificarilor',
              style: AppTheme.lightTheme.textTheme.subtitle1,
            ),
            onTap: () {
            },
          ),
          Divider(
            thickness: 1,
          ),

          ListTile(
            leading: Icon(Icons.cancel),
            title: Text(
              'Sterge Contul',
              style: AppTheme.lightTheme.textTheme.subtitle1,
            ),
            onTap: () async {
              TextEditingController customController = TextEditingController();

              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Pentru a sterge contul va rugam sa confirmati parola",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  content: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Parola',
                    ),
                    controller: customController,
                  ),
                  actions: [
                    MaterialButton(
                      elevation: 5.0,
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    MaterialButton(
                      elevation: 5.0,
                      child: Text('Confirma'),
                      onPressed: () async {
                        String password = customController.text.toString();
                        dynamic result = await FirestoreService().deleteUser(await FirebaseAuth.instance.currentUser(), password, widget.data['type']);

                        if (result != null) {
                          Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                        } else {
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                              msg: 'Eroare. Nu s-a putut efectua.',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white
                          );
                        }
                      },
                    )
                  ],
                );
              });

            },
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

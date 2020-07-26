import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateInfoUser extends StatefulWidget {
  final Map data;

  UpdateInfoUser({this.data});
  @override
  _UpdateInfoUserState createState() => _UpdateInfoUserState();
}

class _UpdateInfoUserState extends State<UpdateInfoUser> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
        title: Text(
          'Update Details',
          style: AppTheme.darkTheme.textTheme.headline2,
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 29,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      Text(
                        'Name : ${widget.data['person'].first_name} ${widget.data['person'].first_name}',
                        style: AppTheme.darkTheme.textTheme.headline3,
                      ),
                      Text(
                        'Email : ${widget.data['person'].email}',
                        style: AppTheme.darkTheme.textTheme.headline3,
                      ),
                      Text(
                        'Address : ${widget.data['person'].address}',
                        style: AppTheme.darkTheme.textTheme.headline3,
                      ),
                      Text(
                        'Phone : ${widget.data['person'].phone}',
                        style: AppTheme.darkTheme.textTheme.headline3,
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            child: Text('Delete Account'),
                            onPressed: () async {
                              await FirestoreService().deleteVulnerable(widget.data['person']);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

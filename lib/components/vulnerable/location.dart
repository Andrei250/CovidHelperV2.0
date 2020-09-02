import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class VulnerableLocation extends StatefulWidget {
  @override
  _VulnerableLocationState createState() => _VulnerableLocationState();
}

class _VulnerableLocationState extends State<VulnerableLocation> {


  String _locationMessage = "";
  String _adressMessage = "";

  void _getCurrentLocation() async {
    final position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  _getLocation() async
  {
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    setState(() {
      _adressMessage = "${first.addressLine}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Location Services")
            ),
            body: Align(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_locationMessage),
                    Text(_adressMessage),
                    FlatButton(
                        onPressed: () {
                          _getCurrentLocation();
                          _getLocation();
                        },
                        color: Colors.green,
                        child: Text("Find Location")
                    )
                  ]),
            )
        )
    );
  }
}

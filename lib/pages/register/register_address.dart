import 'package:covidhelper_v2/pages/register/register_one_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:covidhelper_v2/models/address.dart';

class RegisterAddress extends StatefulWidget {
  @override
  _RegisterAddressState createState() => _RegisterAddressState();
}

class _RegisterAddressState extends State<RegisterAddress> {
  AddressCoordAndText _address = AddressCoordAndText();
  String address;
  String coordinates;
  String errorText;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    bool addressOk;

    void changeAddress(String val) {
      address = val;
    }

    Future getCoordinates() async {
      var addresses = await Geocoder.local.findAddressesFromQuery(address);
      var first = addresses.first;
      _address.long = first.coordinates.longitude.toString();
      _address.lat = first.coordinates.latitude.toString();
    }

    void verifyAddress() {
      if (address == null) {
        errorText = 'Introduceti adresa!';
        addressOk = false;
      } else {
        errorText = null;
        addressOk = true;
      }
    }

    return RegisterOneText(
      label: 'Adresa',
      welcomeTextBig: 'Indroduceti adresa',
      inputType: TextInputType.text,
      passwordText: false,
      route: '/register_address',
      changeValue: changeAddress,
      loading: _loading,
      onButtonNextPressed: () async{
        await getCoordinates();
        setState(() {
          verifyAddress();
          if (addressOk == true) {
            setState(() {
              _loading = true;
            });
            setState(() {
              _address.addressText = address;
            });
            Navigator.of(context)
                .pushNamed('/loading_screen_vendor', arguments: _address );
            setState(() {
              _loading = false;
            });
          }
        });
      },
      onButtonBackPressed: () {
        setState(() {
          _loading = true;
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        });
        Navigator.of(context).pop();
        setState(() {
          _loading = false;
        });
      },
      errorText: errorText,
    );
  }
}
class AddressCoordAndText {
  AddressCoordAndText({this.lat, this.long , this.addressText});

  String addressText;
  String lat;
  String long;

  AddressCoordAndText.fromJson(Map<String, dynamic> parsedJson)
      : addressText = parsedJson['addressText'] ?? '',
        lat = parsedJson['lat'] ?? '',
        long = parsedJson['long'] ?? '';

  Map<String, dynamic> toJson(){
    var dataMap = Map<String, dynamic>();
    dataMap['addressText'] = this.addressText;
    dataMap['lat'] = this.lat;
    dataMap['long'] = this.long;
    return dataMap;
  }
}
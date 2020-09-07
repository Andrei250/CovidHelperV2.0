class AddressCoordAndText {
  AddressCoordAndText({this.coordinates, this.addressText});

  String coordinates;
  String addressText;

  AddressCoordAndText.fromJson(Map<String, dynamic> parsedJson)
      : coordinates = parsedJson['coordinates'] ?? '',
        addressText = parsedJson['address'] ?? '';

  Map<String, dynamic> toJson(){
    var dataMap = Map<String, dynamic>();
    dataMap['coordinates'] = this.coordinates;
    dataMap['address'] = this.addressText;
    return dataMap;
  }
}
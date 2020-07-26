/// Class with the details about a volunteer

class Volunteer {
  const Volunteer({this.name, this.email, this.phoneNumber, this.uid});

  final String name;
  final String email;
  final String phoneNumber;
  final String uid;

  Volunteer.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'] ?? '',
        email = parsedJson['email'] ?? '',
        phoneNumber = parsedJson['phoneNumber'] ?? '',
        uid = parsedJson['uid'] ?? '';

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['name'] = this.name;
    dataMap['email'] = this.email;
    dataMap['phoneNumber'] = this.phoneNumber;
    dataMap['uid'] = this.uid;
    return dataMap;
  }
}

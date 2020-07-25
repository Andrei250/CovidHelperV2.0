class Admin {
  final String first_name;
  final String last_name;
  final String email;

  Admin({this.first_name, this.email, this.last_name});

  Map<String, dynamic> toJson() {
    var dataMap = Map<String, dynamic>();
    dataMap['first_name'] = this.first_name;
    dataMap['last_name'] = this.last_name;
    dataMap['email'] = this.email;
    return dataMap;
  }

}
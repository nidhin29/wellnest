
class Model {
  String? email;
  String? password;
  dynamic name;
  dynamic age;
  dynamic gender;
  dynamic apiKey;
  dynamic address;
  int? profileUpdated;
  int? status;

  Model({this.email, this.password, this.name, this.age, this.gender, this.apiKey, this.address, this.profileUpdated, this.status});

  Model.fromJson(Map<String, dynamic> json) {
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
    name = json["name"];
    age = json["age"];
    gender = json["gender"];
    apiKey = json["api_key"];
    address = json["address"];
    if(json["ProfileUpdated"] is int) {
      profileUpdated = json["ProfileUpdated"];
    }
    if(json["status"] is int) {
      status = json["status"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;
    _data["name"] = name;
    _data["age"] = age;
    _data["gender"] = gender;
    _data["api_key"] = apiKey;
    _data["address"] = address;
    _data["ProfileUpdated"] = profileUpdated;
    _data["status"] = status;
    return _data;
  }
}
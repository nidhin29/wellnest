
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["name"] = name;
    data["age"] = age;
    data["gender"] = gender;
    data["api_key"] = apiKey;
    data["address"] = address;
    data["ProfileUpdated"] = profileUpdated;
    data["status"] = status;
    return data;
  }
}
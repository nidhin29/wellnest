
class SignInModel {
  String? message;
  String? email;

  SignInModel({this.message, this.email});

  SignInModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["email"] = email;
    return data;
  }
}
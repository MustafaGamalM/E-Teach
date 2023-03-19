class RegisterModel {
  String? status;
  String? message;
  User? user;
  Authorisation? authorisation;

  RegisterModel({this.status, this.message, this.user, this.authorisation});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? Authorisation.fromJson(json['authorisation'])
        : null;
  }
}

class User {
  String? name;
  String? email;
  int? id;

  User({this.name, this.email, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }
}

class Authorisation {
  String? token;

  Authorisation({this.token});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}

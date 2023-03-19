class LoginModel {
  String? status;
  User? user;
  Authorisation? authorisation;

  LoginModel({this.status, this.user, this.authorisation});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? Authorisation.fromJson(json['authorisation'])
        : null;
  }
}

class User {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}

class Authorisation {
  String? token;

  Authorisation({this.token});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}

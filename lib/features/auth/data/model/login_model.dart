class LoginModel {
  Response? response;

  LoginModel({this.response});

  LoginModel.fromJson(Map<String, dynamic> json) {
    response =
        json['Response'] != null ? Response.fromJson(json['Response']) : null;
  }
}

class Response {
  String? msg;
  int? statusCode;
  Data? data;

  Response({this.msg, this.statusCode, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? token;

  Data(
      {this.id,
      this.name,
      this.email,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }
}

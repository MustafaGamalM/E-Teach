class RefreshTokenModel {
  Response? response;

  RefreshTokenModel({this.response});

  RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
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
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? type;
  String? token;

  Data({this.id, this.name, this.email, this.type, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
  }
}

class RegisterModel {
  Response? response;

  RegisterModel({this.response});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    response = json['Response'] != null
        ?  Response.fromJson(json['Response'])
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
  String? name;
  String? email;
  String? type;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;

  Data(
      {this.name,
      this.email,
      this.type,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
  }
}

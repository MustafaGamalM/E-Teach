class CreateRoomModel {
  Response? response;

  CreateRoomModel({this.response});

  CreateRoomModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? description;
  int? userId;
  int? id;

  Data({this.name, this.description, this.userId, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    userId = json['user_id'];
    id = json['id'];
  }
}

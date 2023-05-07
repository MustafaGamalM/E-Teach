class CreateCourseModel {
  Response? response;

  CreateCourseModel({this.response});

  CreateCourseModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? instructorName;
  int? instructorId;
  int? id;

  Data({this.name, this.instructorName, this.instructorId, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    instructorName = json['instructor_name'];
    instructorId = json['instructor_id'];
    id = json['id'];
  }
}

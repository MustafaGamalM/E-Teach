import 'package:e_teach/features/home/data/model/course_model.dart';

class SingleCourseModel {
  Response? response;

  SingleCourseModel({this.response});

  SingleCourseModel.fromJson(Map<String, dynamic> json) {
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

  // String? msg;
  // int? statusCode;

  // // this model the same model in courses model
  // Data? data;

  // SingleCourseModel({this.msg, this.statusCode, this.data});

  // SingleCourseModel.fromJson(Map<String, dynamic> json) {
  //   msg = json['msg'];
  //   statusCode = json['statusCode'];
  //   data = json['data'] != null
  //       ? Data.fromJson(json['data'])
  //       : Data(
  //           createdAt: "",
  //           feedback: [],
  //           id: 0,
  //           instructorId: "",
  //           name: "",
  //           updatedAt: "",
  //           videoCourse: []);
  // }
}

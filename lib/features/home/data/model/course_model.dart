class CourseModel {
  Response? response;

  CourseModel({this.response});

  CourseModel.fromJson(Map<String, dynamic> json) {
    response =
        json['Response'] != null ? Response.fromJson(json['Response']) : null;
  }
}

class Response {
  String? msg;
  int? statusCode;
  List<Data>? data;

  Response({this.msg, this.statusCode, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? name;
  String? instructorId;
  String? createdAt;
  String? updatedAt;
  List<String>? videoCourse;
  List<Feedback>? feedback;

  Data(
      {this.id,
      this.name,
      this.instructorId,
      this.createdAt,
      this.updatedAt,
      this.videoCourse,
      this.feedback});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    instructorId = json['instructor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['video_course'] != null) {
      videoCourse = <String>[];
      json['video_course'].forEach((v) {
        videoCourse!.add(v);
      });
    }
    if (json['feedback'] != null) {
      feedback = <Feedback>[];
      json['feedback'].forEach((v) {
        feedback!.add(new Feedback.fromJson(v));
      });
    }
  }
}

class Feedback {
  String? body;

  Feedback({this.body});

  Feedback.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }
}

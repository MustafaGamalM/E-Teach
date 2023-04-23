class CourseModel {
  Response? response;

  CourseModel({this.response});

  CourseModel.fromJson(Map<String, dynamic> json) {
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
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
  String? instructorName;
  int? instructorId;
  String? createdAt;
  String? updatedAt;
  List<VideoCourse>? videoCourse;
  List<Feedback>? feedback;

  Data(
      {this.id,
      this.name,
      this.instructorName,
      this.instructorId,
      this.createdAt,
      this.updatedAt,
      this.videoCourse,
      this.feedback});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    instructorName = json['instructor_name'];
    instructorId = json['instructor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['video_course'] != null) {
      videoCourse = <VideoCourse>[];
      json['video_course'].forEach((v) {
        videoCourse!.add(new VideoCourse.fromJson(v));
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

class VideoCourse {
  String? name;
  String? videos;

  VideoCourse({this.name, this.videos});

  VideoCourse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    videos = json['videos'];
  }
}

class Feedback {
  int? body;

  Feedback({this.body});

  Feedback.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }
}

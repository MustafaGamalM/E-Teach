class SingleCourseModel {
  Response? response;

  SingleCourseModel({this.response});

  SingleCourseModel.fromJson(Map<String, dynamic> json) {
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['Response'] = this.response!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['instructor_name'] = this.instructorName;
    data['instructor_id'] = this.instructorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.videoCourse != null) {
      data['video_course'] = this.videoCourse!.map((v) => v.toJson()).toList();
    }
    if (this.feedback != null) {
      data['feedback'] = this.feedback!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['videos'] = this.videos;
    return data;
  }
}

class Feedback {
  int? body;

  Feedback({this.body});

  Feedback.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    return data;
  }
}

class UploadVideoModel {
  Response? response;
  UploadVideoModel.fromJson(Map<String, dynamic> json) {
    response = Response.fronJson(json['Response']);
  }
}

class Response {
  String? msg;
  int? statusCode;
  Response.fronJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statusCode = json['statusCode'];
  }
}

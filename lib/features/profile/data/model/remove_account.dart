class RemoveAccountModel {
  Response? response;

  RemoveAccountModel({this.response});

  RemoveAccountModel.fromJson(Map<String, dynamic> json) {
    response =
        json['Response'] != null ? Response.fromJson(json['Response']) : null;
  }
}

class Response {
  String? msg;
  int? statusCode;

  Response({this.msg, this.statusCode});

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statusCode = json['statusCode'];
  }
}

class RoomChatModel {
  List<RoomChat>? roomChat;

  RoomChatModel({this.roomChat});

  RoomChatModel.fromJson(Map<String, dynamic> json) {
    if (json['Room Chat'] != null) {
      roomChat = <RoomChat>[];
      json['Room Chat'].forEach((v) {
        roomChat!.add(new RoomChat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roomChat != null) {
      data['Room Chat'] = this.roomChat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoomChat {
  String? sender;
  String? messageText;
  String? file;
  String? createdAt;

  RoomChat({this.sender, this.messageText, this.file, this.createdAt});

  RoomChat.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    messageText = json['message_text'];
    file = json['file'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['message_text'] = this.messageText;
    data['file'] = this.file;
    data['created_at'] = this.createdAt;
    return data;
  }
}

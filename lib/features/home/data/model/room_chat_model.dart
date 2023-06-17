class RoomChatModel {
  List<RoomChat>? roomChat;

  RoomChatModel({this.roomChat});

  RoomChatModel.fromJson(Map<String, dynamic> json) {
    if (json['Room Chat'] != null) {
      roomChat = <RoomChat>[];
      json['Room Chat'].forEach((v) {
        roomChat!.add(RoomChat.fromJson(v));
      });
    }
  }
}

class RoomChat {
  String? sender;
  String? messageText;
  String? createdAt;

  RoomChat({this.sender, this.messageText, this.createdAt});

  RoomChat.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    messageText = json['message_text'] ?? "mustafaaaaaaaaaaaaa";
    createdAt = json['created_at'];
  }
}

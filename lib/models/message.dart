import 'package:flutter_application_1/constants/constants.dart';

class Message {

  final String message;
  final String id;
  Message({
    required this.message,
    required this.id,
  });

  
  factory Message.fromjson(jsonData) {
    return Message(
      message: jsonData[Kmessage],
      id: jsonData['id'],
    );
  }

}

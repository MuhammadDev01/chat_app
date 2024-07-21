import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/message.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static String ID = 'ChatPage';
  CollectionReference messageRefrence =
      FirebaseFirestore.instance.collection(KmessageCollection);
  TextEditingController controller = TextEditingController();
  final _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
      var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messageRefrence.orderBy(Ktimecreated,descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromjson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Klogo,
                      height: 55,
                    ),
                    const Text(' Chat'),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                        reverse: true,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return messageList[index].id ==email? ChatBuble(messageText: messageList[index]):ChatBubleToFriend(messageText: messageList[index]);
                    },
                    itemCount: messageList.length,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messageRefrence.add({
                          Kmessage: data,
                          Ktimecreated: DateTime.now(),
                          'id' : email,
                        });
                        controller.clear();

                        _scrollController.animateTo(
                          0,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      decoration: const InputDecoration(
                        hintText: 'send messasge',
                        suffixIcon: Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text('Loading...');
          }
        });
  }
}

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.messageText,
  });

  final Message messageText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(14),
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
        child: Text(
          messageText.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubleToFriend extends StatelessWidget {
  const ChatBubleToFriend({
    super.key,
    required this.messageText,
  });

  final Message messageText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(14),
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
            bottomLeft: Radius.circular(32.0),
          ),
        ),
        child: Text(
          messageText.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

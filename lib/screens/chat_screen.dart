import 'package:flutter/material.dart';
import 'package:online_library/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_library/components/message_buble.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";

  const ChatScreen({Key? key}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  late String messageText;
  final messageTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    gerCurrentUser();
  }

  void gerCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  // void getMessages() async {
  //   final messages = await _firestore.collection('messages').get();
  // for (var message in messages.docs) {
  //   print(message.data());
  // }
  // }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Чат обратной связи',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const StreamBuilderClass(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                      },
                      icon: const Icon(Icons.send)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StreamBuilderClass extends StatelessWidget {
  const StreamBuilderClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            _firestore.collection('messages').orderBy('timestamp').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ));
          }
          final messages = snapshot.data!.docs.reversed;
          // messages.sort((a, b) => a['timestamp'].compareTo(b['timestamp']));
          List<MessageBubble> messagBubles = [];
          for (var message in messages) {
            final messageData = message.data() as Map<String, dynamic>;
            final messageText = messageData['text'];
            final messageSender = messageData['sender'];
            final currentUser = loggedInUser.email;
            final currentTime = messageData['timestamp'];
            final date = currentTime != null
                ? DateTime.fromMillisecondsSinceEpoch(
                    currentTime.millisecondsSinceEpoch)
                : DateTime.now();
            final messageTimeSend = '${date.hour}:${date.minute}';
            print("sdsdsdsd $messageSender");
            print('XXXXXXXXXXXXX $messageText');
            final messageWidget = MessageBubble(
                sender: messageSender,
                text: messageText,
                sendTime: messageTimeSend,
                isMe: currentUser == messageSender ? true : false);
            messagBubles.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messagBubles,
            ),
          );
        });
  }
}

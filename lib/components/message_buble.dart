import 'package:flutter/material.dart';
class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key, required this.sender,
      required this.text,
      required this.sendTime,
      required this.isMe}) : super(key: key);
  final String sender;
  final String text;
  final String sendTime;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            "$sender",
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
          GestureDetector(
            child: Material(
                borderRadius: isMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))
                    : const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                elevation: 5,
                color: isMe ? Colors.lightBlueAccent : Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$text',
                          style: TextStyle(
                              color: isMe ? Colors.white : Colors.black54,
                              fontSize: 15),
                        ),
                        const SizedBox(width: 10, height: 20),
                        Text(
                          '$sendTime',
                          style: TextStyle(
                              color: isMe ? Colors.white : Colors.black54,
                              fontSize: 10),
                        ),
                      ]),
                )),
            onLongPress: () {
              // выполнение действия при удержании кнопки
            },
          ),
        ],
      ),
    );
  }
}

import 'model/message.dart';

class Data {
  static final chat = <Message>[
    const Message(isMe: false, message: 'Hello'),
    const Message(isMe: true, message: 'Hi, How you doing?'),
    const Message(isMe: false, message: 'Great! What about you?'),
    const Message(isMe: true, message: 'I\'m also doing fine'),
    const Message(isMe: false, message: 'Do you like travelling?'),
    const Message(isMe: true, message: 'Yes, I love travelling'),
    const Message(isMe: false, message: 'Lets go on a trip'),
    const Message(isMe: true, message: 'Cool, where are we going?'),
  ];
}
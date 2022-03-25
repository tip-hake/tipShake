class Message {
  final int id;
  final String type;
  final String name;
  final String text;
  final String time;

  const Message({required this.id,required this.type,required this.name,required this.text,required this.time});
}

class MessageList {
  static List<Message> list () {
    const data = <Message> [
      Message(
          id: 1,
          text: 'hi',
          type: 'sender',
          name: 'Erina',
          time: '11:00PM'
      ),
      Message(
          id: 2,
          text: 'hello',
          type: 'receiver',
          time: '11.10PM',
          name: 'Jhon'
      ),
      Message(
          id: 1,
          text: 'How can I help you?',
          type: 'sender',
          name: 'Erina',
          time: '11:15PM'
      ),
      Message(
          id: 2,
          text: 'Facing with withdrawal payment',
          type: 'receiver',
          time: '11.20PM',
          name: 'Jhon'
      ),
      Message(
          id: 1,
          text: 'Let me check, please wait',
          type: 'sender',
          name: 'Erina',
          time: '11:25PM'
      ),
      Message(
          id: 2,
          text: 'Sure, please take your time.',
          type: 'receiver',
          time: '11.30PM',
          name: 'Jhon'
      ),
    ];
    return data;
  }
}
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {// Es una clase que se extiende ChangeNotifier. ChangeNotifier es una clase en Flutter que proporciona una forma de notificación a los widgets que están escuchando (a través de Provider) cuando ocurre un cambio en los datos de esta clase.
  final chatScrollController = ScrollController();// Es una propiedad de tipo ScrollController. Los controladores de desplazamiento ( ScrollController) se utilizan en Flutter para controlar el desplazamiento de un widget, como una lista o un desplazamiento en una vista de desplazamiento.
  final getYesNoAnswer = GetYesNoAnswer();//

  List<Message> messageList = [//Es una lista que almacena objetos de la clase Message.
    Message(text: 'Hola Team', fromWho: FromWho.me),
    Message(text: 'Tienes dudas sobre la app?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
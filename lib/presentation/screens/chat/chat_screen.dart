import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/bot_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget { // Define la clase ChatScreen que extiende de StatelessWidget, representando la pantalla del chat en la aplicación.
  const ChatScreen({super.key}); // define un constructor para la clase ChatScreen. Este constructor acepta un parámetro opcional llamado key y crea una instancia de ChatScreen.

  @override// indica que estamos anulando este método de la clase padre.

  Widget build(BuildContext context) { // Es el método que construye la estructura de la interfaz de usuario de la pantalla del chat. Toma un contexto ( context) como parámetro y devuelve un widget.
    return Scaffold( // Recupera un widget Scaffold, que es una estructura básica para las páginas de Flutter.
      appBar: AppBar( // Configura la barra de aplicaciones en la parte superior de la pantalla.
        leading: const Padding( // es un widget que se coloca a la izquierda de la barra de aplicación. En este caso, se usa un Padding para agregar un relleno y contiene padding
          padding: EdgeInsets.all(4.0), // se usa un Padding para agregar un relleno y contiene un 
          child: CircleAvatar( // CircleAvatar que representa la imagen de perfil del usuario. La imagen se carga desde una URL utilizando NetworkImage.
            backgroundImage: NetworkImage(// La imagen se carga desde una URL utilizando NetworkImage.
                'https://media-exp1.licdn.com/dms/image/C560BAQGWVEObwG5HKA/company-logo_200_200/0/1625695941132?e=2159024400&v=beta&t=x-9uUdRVm8vwsWCySuUf14zsi1Ys2hMI_w62SA1L41I'),
          ),
        ),
        title: const Text('Laika Bot Soporte'),// es un widget de texto que muestra el título de la barra de aplicación.
        centerTitle: false,// es un booleano que indica si el título debe estar centrado (true) o alineado a la izquierda (false). Aquí está establecido en false.
      ),
      body: _ChatView(),// es el contenido principal de la pantalla del chat y está representado por el widget _ChatView().
    );
  }
}

class _ChatView extends StatelessWidget {// define la clase _ChatView que extiende de StatelessWidget. Este widget representa la vista del chat en la aplicación.
  @override
  Widget build(BuildContext context) { //  Es el método que construye la estructura de la interfaz de usuario de la vista de chat. Toma un contexto ( context) como parámetro y devuelve un widget.
    final chatProvider = context.watch<ChatProvider>();// declara una variable llamada chatProvider.|context es un objeto que proporciona información sobre la ubicación actual en el árbol de widgets.|watch<ChatProvider>()se utiliza para escuchar los cambios en ChatProvider. Si hay un cambio en ChatProvider, este widget se reconstruirá para reflejar esos cambios.

    return SafeArea(//es un widget que asegura que su hijo no esté bajo la barra de estado, la barra de aplicación y los botones de navegación del sistema operativo. Es útil para garantizar que el contenido de la aplicación sea visible en todas las pantallas.
      child: Padding(// es un widget que agrega relleno alrededor de su hijo.
        padding: const EdgeInsets.symmetric(horizontal: 10),// establece el relleno horizontal de 10 unidades alrededor del contenido dentro del Padding.
        child: Column(// es un widget que organiza sus hijos en una columna vertical.
 
          children: [//es una lista de widgets que serán colocados en la columna.
            Expanded(// hace que su hijo (en este caso, un ListView.builder) ocupe todo el espacio vertical disponible.
                child: ListView.builder(//es un widget que construye una lista a partir de un generador de elementos bajo demanda (por ejemplo, cuando se desplaza).
                  controller: chatProvider.chatScrollController,//  permite controlar el desplazamiento de la lista. En este caso, se utiliza un controlador de desplazamiento proporcionado por chatProvider.
                    itemCount: chatProvider.messageList.length,//  define la cantidad de elementos en la lista, que está determinada por la longitud de la lista de mensajes en chatProvider.
                    itemBuilder: (context, index) {//es una función que construye un elemento de la lista en función de su posición en la lista.
                      final message = chatProvider.messageList[index];
                       
                      return (message.fromWho == FromWho.hers)// Se devuelve un BotMessageBubble si el mensaje proviene de "Bot" y un MyMessageBubble si proviene de (yo)
                          ? BotMessageBubble( message: message )
                          : MyMessageBubble( message: message );
                    })),

            /// Caja de texto de mensajes
            MessageFieldBox(// es un widget que representa una caja de texto donde los usuarios pueden escribir mensajes.
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage, // es una función de devolución de llamada que se llama cuando se envía un mensaje desde la caja de texto. En este caso, se llama a chatProvider.sendMessage para enviar el mensaje.
            ),
          ],
        ),
      ),
    );
  }
}

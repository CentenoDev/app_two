import 'package:flutter/material.dart'; //  Importa la biblioteca flutter/material.dart, que es necesaria para crear la interfaz de usuario (UI) en Flutter.
import 'package:provider/provider.dart'; //  Importa la biblioteca provider de Flutter, que se utiliza para manejar el estado de la aplicación.

import 'package:yes_no_app/config/theme/app_theme.dart'; // Importa una biblioteca personalizada app_theme.dart relacionada con la configuración del tema de la aplicación.
import 'package:yes_no_app/presentation/providers/chat_provider.dart';// Importa una biblioteca personalizada chat_provider.dart relacionada con la administración del chat.
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';// Importa una biblioteca personalizada chat_screen.dart que contiene la pantalla del chat.

void main() => runApp(const MyApp()); // define la función principal main que inicia la aplicación ejecutando el widget MyApp.
class MyApp extends StatelessWidget { // define la clase MyApp que extiende de StatelessWidget, representando la aplicación.
  const MyApp({super.key});

  @override // Es un decorador que indica que se está anulando un método de la clase padre. En este caso, se está anulando el método build de la clase padre StatelessWidget.
  Widget build(BuildContext context) { // es el método que construye la estructura de la interfaz de usuario de la aplicación. Toma un contexto (context) como parámetro y devuelve un widget.
    return MultiProvider( // retorna un widget MultiProvider. MultiProvider es un widget que permite proporcionar múltiples objetos a varios widgets descendientes.
      providers: [ // Es una lista de providers de datos. En este caso, hay un único proveedor
        ChangeNotifierProvider(create: (_) => ChatProvider() ) // ChangeNotifierProvider que crea e inicializa un objeto de tipo ChatProvider
      ],
      child: MaterialApp( // Es el widget que configura la aplicación de Flutter.
        title: 'Bot Empresarial', // Establece el título de la aplicación como 'Bot Empresarial'.
        debugShowCheckedModeBanner: false, // Establece si se muestra la bandera de modo de depuración en la esquina superior derecha de la pantalla.
        theme: AppTheme( selectedColor: 0 ).theme(), // Configura el tema de la aplicación utilizando un objeto AppTheme, con un color seleccionado específico (0 en este caso).
        home: const ChatScreen() // Establece la pantalla inicial de la aplicación como ChatScreen.
      ),
    );
  }
}



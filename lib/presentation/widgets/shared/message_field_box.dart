import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {//Defina la clase MessageFieldBox que se extiende de StatelessWidget. Este widget representa la caja de texto donde los usuarios escriben sus mensajes.
  final ValueChanged<String> onValue; // Defina la clase MessageFieldBox que se extiende de StatelessWidget. Este widget representa la caja de texto donde los usuarios escriben sus mensajes.
  // es un tipo de función de devolución de llamada que toma una cadena ( String) como argumento y no devuelve nada.
  const MessageFieldBox({super.key, required this.onValue});
/*
Este es el constructor de la clase MessageFieldBox. Toma dos argumentos:
super.key: Esta es una propiedad heredada de StatelessWidgetque se utiliza 
para identificar de manera única el widget en el árbol de widgets. En este caso,
 la propiedad keyse pasa como una propiedad superada (superkey).
required this.onValue: Esta es la propiedad onValueque se mencionó anteriormente.
 Es requerido (required) en el constructor, lo que significa que debe proporcionarse 
 cuando se crea una instancia de MessageFieldBox. Esta propiedad se utiliza para manejar
  los cambios en el valor del campo de texto.
*/
  @override// indica que estamos anulando este método de la clase padre.
  Widget build(BuildContext context) {//es el método que construye la estructura de la interfaz de usuario de la caja de texto.
    final textController = TextEditingController();// es un controlador para la caja de texto, Es utilizado para controlar el texto que se muestra y se introduce en la caja de texto.
    final focusNode = FocusNode();// es utilizado para gestionar el foco en la caja de texto. Esto es útil para controlar si la caja de texto tiene el foco (está siendo editada) o no.

    final outlineInputBorder = UnderlineInputBorder(//es un borde para la caja de texto que se muestra cuando no está en foco. En este caso, es un borde de subrayado transparente con un radio de esquina de 40.
        borderSide: const BorderSide(color: Colors.transparent),// indica que es un borde subrayado transparente
        borderRadius: BorderRadius.circular(40));// y se establece un borde circularar de 40

    final inputDecoration = InputDecoration(//configura la apariencia y el comportamiento de la caja de texto.
      hintText: 'Termina tu mensaje con un "?"',//Es un texto que se muestra como pista o guía dentro de la caja de texto cuando está vacía.
      enabledBorder: outlineInputBorder,// Establecen los bordes de la caja de texto cuando no está en foco y cuando está en foco, respectivamente. Se utilizan outlineInputBorder para ambos.
      focusedBorder: outlineInputBorder,//Establecen los bordes de la caja de texto cuando no está en foco y cuando está en foco, respectivamente. Se utilizan outlineInputBorder para ambos.
      filled: true,//Indica si la caja de texto debe estar llena o no.
      suffixIcon: IconButton(//Es un ícono que se muestra al final de la caja de texto.
        icon: const Icon(Icons.send_outlined),//es un icono que actúa como un botón. Es el ícono que se muestra en el botón, en este caso, un ícono de "enviar".
        onPressed: () {//Define la función que se ejecuta cuando se presiona el botón.
          final textValue = textController.value.text;//En este caso, obtiene el texto de la caja de texto, 
          textController.clear();//lo limpia y llama a onValue(textValue)
          onValue(textValue);//que es la función de devolución de llamada pasada a la clase.
        },
      ),
    );

    return TextFormField(//es un widget que crea una caja de texto que permite al usuario ingresar texto.
      onTapOutside: (event) {//es una función que se llama cuando se toca fuera del campo de texto. 
        focusNode.unfocus();//En este caso, la función focusNode.unfocus() se llama para quitar el foco del campo de texto cuando se toca fuera de él.
      },
      focusNode: focusNode,//es un nodo de foco que se utiliza para controlar el foco del campo de texto. Esto permite enfocar o quitar el foco del campo de texto programáticamente.
      controller: textController,//es el controlador del campo de texto. Se utiliza para controlar y acceder al contenido del campo de texto.
      decoration: inputDecoration,//define la apariencia y el comportamiento del campo de texto, y se basa en la configuración previamente definida en inputDecoration.
      onFieldSubmitted: (value) {//es una función que se llama cuando se presiona la tecla "Enviar" en el teclado o se envía el formulario. En este caso, cuando se activa, la función hace lo siguiente:
        textController.clear();// Borra el contenido del campo de texto.
        focusNode.requestFocus();// Vuelve a enfocar el campo de texto, lo que significa que el cursor vuelve al campo de texto después de enviar el mensaje.
        onValue(value);//Llama a la función de devolución de llamada onValue que se pasó como parámetro a MessageFieldBox, pasando el valor del campo de texto como argumento. Esto permite procesar el mensaje ingresado.
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class BotMessageBubble extends StatelessWidget {//Define la clase BotMessageBubble que extiende de StatelessWidget. Este widget representa la burbuja de mensaje del bot.
  final Message message;// declara un campo llamado message de tipo Message.||contiene la información del mensaje, como el contenido y el remitente.

  const BotMessageBubble({super.key, required this.message});/* Define un constructor con nombre para BotMessageBubble que acepta un parámetro opcional key y un parámetro requerido message de tipo Message.
super.key es una referencia a la clave proporcionada por la clase padre (super).
required this.message indica que message es un parámetro requerido y se asigna al campo message de la clase.*/

  @override// indica que estamos anulando este método de la clase padre.
  
  Widget build(BuildContext context) {//es el método que construye la estructura de la interfaz de usuario de la burbuja de mensaje del bot.
    final colors = Theme.of(context).colorScheme;/*obtiene el tema actual del contexto (context).
colorScheme accede al esquema de colores del tema actual. Un esquema de colores incluye diferentes colores como el color primario, el color secundario, etc.
    */

    return Column(//es un widget que organiza sus hijos en una columna vertical.
      crossAxisAlignment: CrossAxisAlignment.start,//alinea los elementos secundarios en el eje transversal (en este caso, horizontalmente). CrossAxisAlignment.start alinea los elementos al principio del eje transversal (izquierda en una columna).
      children: [//es una lista de widgets que se colocarán en la columna.
        Container(//es un widget que permite personalizar la decoración y diseño de su contenido.
          decoration: BoxDecoration(//define la decoración del contenedor, que incluye el color de fondo y la forma de los bordes.
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),//Establece el color de fondo del contenedor utilizando el color secundario obtenido del esquema de colores (colors).Establece los bordes redondeados del contenedor.
          child: Padding(//agrega relleno alrededor de su hijo, que es un Text en este caso.
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),//Establece el relleno horizontal y vertical del contenido del contenedor.
            child: Text(//es un widget que muestra texto.
              message.text,//Muestra el texto del mensaje actual (message) en la burbuja de mensaje.
              style: const TextStyle(color: Colors.white),//Establece el estilo del texto, en este caso, el color del texto es blanco.
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble( message.imageUrl! ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble( this.imageUrl );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Mi amor está enviando una imagen'),
            );
          },
        ));
  }
}

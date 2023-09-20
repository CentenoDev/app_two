import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {//Defina la clase MyMessageBubble que se extiende de StatelessWidget. Este widget representa la burbuja de mensaje del usuario actual.
  final Message message;/*final declara un campo llamado message de tipo Message.
Message  es una clase que contiene la información del mensaje, como el contenido y el remitente.*/ 

  const MyMessageBubble({//define un constructor con nombre para MyMessageBubble que acepta un parámetro opcional key y un parámetro requerido message de tipo Message.
    super.key, //es una referencia a la clave proporcionada por la clase padre (super).
    required this.message//indica que message es un parámetro requerido y se asigna al campo message de la clase.
  });

  @override//indica que estamos anulando este método de la clase padre.
  Widget build(BuildContext context) {//es el método que construye la estructura de la interfaz de usuario de la burbuja de mensaje del usuario actual.
    final colors = Theme.of(context).colorScheme;/*Theme.of(context) obtiene el tema actual del contexto (context).
colorScheme accede al esquema de colores del tema actual. Un esquema de colores incluye diferentes colores 
como el color primario, el color secundario, etc. */

    return Column(// es un widget que organiza sus hijos en una columna vertical.
      crossAxisAlignment: CrossAxisAlignment.end,//alinea los elementos secundarios en el eje transversal (en este caso, horizontalmente). |  alinea los elementos al final del eje transversal (derecha en una columna).
      children: [//es una lista de widgets que se colocarán en la columna.
        Container(// es un widget que permite personalizar la decoración y diseño de su contenido.
          decoration: BoxDecoration(// define la decoración del contenedor, que incluye el color de fondo y la forma de los bordes.
              color: colors.primary, borderRadius: BorderRadius.circular(20)),//Establece el color de fondo del contenedor utilizando el color primario obtenido del esquema de colores (colors).||Establece los bordes redondeados del contenedor.
          child: Padding(//agrega relleno alrededor de su hijo, que es un Text en este caso.
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),//Establece el relleno horizontal y vertical del contenido del contenedor.
            child: Text(// es un widget que muestra texto.
              message.text,//Muestra el texto del mensaje actual (message) en la burbuja de mensaje.
              style: const TextStyle(color: Colors.white),//Establece el estilo del texto, en este caso, el color del texto es blanco.
            ),
          ),
        ),
        const SizedBox(height: 5)/**es un widget que proporciona un espacio vacío de altura 5.
Esto se utiliza para agregar un pequeño espacio entre la burbuja de mensaje y el siguiente elemento en la columna. */
      ],
    );
  }
}

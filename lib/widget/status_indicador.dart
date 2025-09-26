import 'package:flutter/material.dart';

import '../ultis/app_styles.dart';
import '../ultis/strings.dart';

class StatusIndicador extends StatefulWidget {

  final String indicadorTitulo;
  const StatusIndicador({super.key, required this.indicadorTitulo});

  @override
  State<StatusIndicador> createState() => _StatusIndicadorState();
}

class _StatusIndicadorState extends State<StatusIndicador> {
  //define o tamanho dos Containet AZUL
  double alturaContainer = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.red,
      ),
      width: 240.0,
      height: alturaContainer,
      //Status Desaparecios ou Encontrado
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          widget.indicadorTitulo.toUpperCase(),
          //Style Personalizado
          style: AppStyles.textoDesaparecidoStyle,
        ),
      ),
    );
  }
}

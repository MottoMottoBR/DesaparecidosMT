import 'package:flutter/material.dart';

class LocalizadosDesaparecido extends StatefulWidget {
  const LocalizadosDesaparecido({super.key});

  @override
  State<LocalizadosDesaparecido> createState() => _LocalizadosDesaparecidoState();
}

class _LocalizadosDesaparecidoState extends State<LocalizadosDesaparecido> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Localizados'),
        SizedBox(width: 5,),
        Text('Desaparecidos')
      ],
    );
  }
}

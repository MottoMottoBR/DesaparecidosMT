import 'package:flutter/material.dart';

class BackGroudCentral extends StatefulWidget {
  const BackGroudCentral({super.key});

  @override
  State<BackGroudCentral> createState() => _BackGroudCentralState();
}

class _BackGroudCentralState extends State<BackGroudCentral> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('lib/imagens/pessoas.jpg'),
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(color: Colors.white),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomBotao extends StatefulWidget {
  final String text;
  final Color color;
  const CustomBotao({super.key, required this.text, required this.color});

  @override
  State<CustomBotao> createState() => _CustomBotaoState();
}

class _CustomBotaoState extends State<CustomBotao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(widget.text)),
    );
  }
}

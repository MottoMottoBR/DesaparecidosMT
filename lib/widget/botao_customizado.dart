import 'package:flutter/material.dart';

class CustomBotao extends StatefulWidget {
  final String text;
  final Color color;

  final icon;
  const CustomBotao({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
  });

  @override
  State<CustomBotao> createState() => _CustomBotaoState();
}

class _CustomBotaoState extends State<CustomBotao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, color: Colors.white),
          Text(widget.text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

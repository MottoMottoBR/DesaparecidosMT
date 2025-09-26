import 'package:flutter/material.dart';

class CustonContainerFoto extends StatefulWidget {
  final String urlFoto;

  const CustonContainerFoto({super.key, required this.urlFoto});

  @override
  State<CustonContainerFoto> createState() => _CustonContainerFotoState();
}

class _CustonContainerFotoState extends State<CustonContainerFoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.red,
      ),
      width: 500.0,
      height: 500.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Image.network(widget.urlFoto, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

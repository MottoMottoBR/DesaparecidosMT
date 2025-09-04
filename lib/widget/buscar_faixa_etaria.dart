import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';

class BuscaFaixaEtaria extends StatelessWidget {
  const BuscaFaixaEtaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SpinBox(
            min: 0,
            max: 120,
            value: 0,
            decoration: const InputDecoration(labelText: "Mínima"),
            onChanged: (value) => print("Mínima: $value"),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SpinBox(
            min: 0,
            max: 120,
            value: 0,
            decoration: const InputDecoration(labelText: "Máxima"),
            onChanged: (value) => print("Máxima: $value"),
          ),
        ),
      ],
    );
  }
}

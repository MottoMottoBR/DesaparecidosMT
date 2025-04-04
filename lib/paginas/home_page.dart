import 'package:desaparecidosmt/componentes/busca.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomAppbar(),
            Busca(),
          ],
        ),
      ),
    );
  }
}

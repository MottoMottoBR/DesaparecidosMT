import 'package:flutter/material.dart';
import '../estrutura/back_ground_central.dart';
import '../estrutura/topo_policia_civil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Topo Principal com Banner
            TopoPoliciaCivil(),

            //Imagem Do Fundo
            BackGroudCentral(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/api_service/api_repository.dart';
import 'package:myapp/componentes/estatisticas_widget.dart';
import 'package:myapp/paginas/pessoas_desaparecidas.dart';
import '../estrutura/topo_policia_civil.dart';
import 'caixa_busca.dart';

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
            //Campo De Busca
            Busca(),
            //Lista de pessoas desaparecidas dinamica
            PessoasDesaparecidas(),
          ],
        ),
      ),
    );
  }
}

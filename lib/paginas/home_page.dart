import 'package:flutter/material.dart';
import 'package:myapp/api_service/api_repository.dart';
import 'package:myapp/componentes/estatisticas_widget.dart';
import 'package:myapp/estrutura/rodape_page.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Topo Principal com Banner
            TopoPoliciaCivil(),
            //Campo De Busca
            Busca(),
            SizedBox(height: 80),
            //Lista de pessoas desaparecidas dinamica
            Column(
              children: [
                Text(
                  "Resultado",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "_____________________________________________________________________",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 250.0,
                vertical: 80,
              ), // Ajuste o valor '20.0'
              child: PessoasDesaparecidas(),
            ),
            //Rodapé da Pagina
            RodapePage(),
          ],
        ),
      ),
    );
  }
}

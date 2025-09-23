import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
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
                  Divider(
                    color: Colors.black,
                    thickness: 0.8,
                    indent: 500,
                    endIndent: 500,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ), // Ajuste o valor '20.0'
                child: PessoasDesaparecidas(),
              ),
              //Rodapé da Pagina
              RodapePage(),
            ],
          ),
        ),
      ),
    );
  }
}

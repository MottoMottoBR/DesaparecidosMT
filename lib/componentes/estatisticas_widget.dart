import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/api_service/api_repository.dart';
import 'package:myapp/models/estatisticas_model.dart';

class EstatisticasWidget extends StatelessWidget {
  const EstatisticasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Chama o método getEstatisticas() para buscar os dados
    return FutureBuilder<EstatisticasModel>(
      future: ApiRepositorio().getEstatisticas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Exibe um indicador de progresso enquanto os dados são carregados
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Exibe uma mensagem de erro se a requisição falhar
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          // Exibe os dados estatísticos
          final estatisticas = snapshot.data!;
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'DESAPARECIDOS',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        '${estatisticas.quantPessoasDesaparecidas}',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        'LOCALIZADOS',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        '${estatisticas.quantPessoasEncontradas}',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else {
          // Exibe uma mensagem se não houver dados
          return const Center(
            child: Text('Nenhum dado estatístico disponível.'),
          );
        }
      },
    );
  }
}

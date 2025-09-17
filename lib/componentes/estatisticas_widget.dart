import 'package:flutter/material.dart';
import 'package:myapp/api_service/api_repository.dart';
import 'package:myapp/models/estatisticas_model.dart';

class EstatisticasWidget extends StatelessWidget {
  const EstatisticasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EstatisticasModel>(
      future: ApiRepositorio().getEstatisticas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
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
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      Text(
                        '${estatisticas.quantPessoasDesaparecidas}',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),

                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        'LOCALIZADOS',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                      Text(
                        '${estatisticas.quantPessoasEncontradas}',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('Nenhum dado estatístico disponível.'),
          );
        }
      },
    );
  }
}

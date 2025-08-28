import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopoPoliciaCivil extends StatelessWidget {
  const TopoPoliciaCivil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black87, Colors.black45],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("lib/imagens/logocivil.png", width: 80, height: 80),
              Column(
                children: [
                  Text(
                    "Polícia Judiciária Civil",
                    style: GoogleFonts.adamina(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    " Estado de Mato Grosso",
                    style: GoogleFonts.adamina(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.person_2, color: Colors.white),
              Text(
                'Pessoas Desaparecidas',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}

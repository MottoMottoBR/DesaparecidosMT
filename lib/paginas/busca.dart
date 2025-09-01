import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componentes/tex_form_field_custom.dart';

class Busca extends StatefulWidget {
  const Busca({super.key});

  @override
  State<Busca> createState() => _BackGroudCentralState();
}

class _BackGroudCentralState extends State<Busca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/imagens/pessoas.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(90.0),
        child: Row(
          children: [
            //Container Branco de Busca
            Container(
              width: 500,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Busca',
                      style: GoogleFonts.abel(
                        textStyle: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                    Text(
                      'Digite as informações conhecidas para uma busca mais precisa',
                      style: GoogleFonts.abel(
                        textStyle: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    CustomTextField( hintText: 'Nome', labelText: 'Nome',),

                    Text(
                      'Faixa Etária:',
                      style: GoogleFonts.abel(
                        textStyle: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [

                      ],
                    )
                  ],
                ),
              ),

              //decoration: BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}

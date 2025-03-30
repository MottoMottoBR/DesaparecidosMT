import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                SizedBox(
                  width: 320,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/img/logo.png',
                          width: 80,
                        ),
                        Column(
                          children: [
                            Text(
                              'Polícia Judiciária Civil',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Estado de Mato Grosso',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Pessoas Desaparecidas',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

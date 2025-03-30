import 'package:flutter/material.dart';

class Busca extends StatefulWidget {
  const Busca({super.key});

  @override
  State<Busca> createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {
  final _formKey = GlobalKey<FormState>();
  String? _nome;
  int? _idadeMinima;
  int? _idadeMaxima;
  String? _sexo;
  String? _status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/img/pessoa.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 500, // Mantive a altura, mas o SingleChildScrollView vai lidar com o overflow
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: SingleChildScrollView( // Adicionado para permitir rolagem
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              'Busca',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Digite as informações conhecidas para uma busca mais precisa',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) => _nome = value,
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Faixa Etária:',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Mínima',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onSaved: (value) => _idadeMinima = int.tryParse(value ?? ''),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Máxima',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onSaved: (value) => _idadeMaxima = int.tryParse(value ?? ''),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Sexo:'),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'Masculino',
                                          groupValue: _sexo,
                                          onChanged: (value) {
                                            setState(() {
                                              _sexo = value;
                                            });
                                          },
                                        ),
                                        const Text('Masculino'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'Feminino',
                                          groupValue: _sexo,
                                          onChanged: (value) {
                                            setState(() {
                                              _sexo = value;
                                            });
                                          },
                                        ),
                                        const Text('Feminino'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Status:'),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'Desaparecido',
                                          groupValue: _status,
                                          onChanged: (value) {
                                            setState(() {
                                              _status = value;
                                            });
                                          },
                                        ),
                                        const Text('Desaparecido'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'Localizado',
                                          groupValue: _status,
                                          onChanged: (value) {
                                            setState(() {
                                              _status = value;
                                            });
                                          },
                                        ),
                                        const Text('Localizado'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _formKey.currentState?.reset();
                                    _nome = null;
                                    _idadeMinima = null;
                                    _idadeMaxima = null;
                                    _sexo = null;
                                    _status = null;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.clear),
                                    SizedBox(width: 8),
                                    Text('LIMPAR'),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    print('Buscando: Nome: $_nome, Idade Mínima: $_idadeMinima, Idade Máxima: $_idadeMaxima, Sexo: $_sexo, Status: $_status');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow[700],
                                  foregroundColor: Colors.black,
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.search),
                                    SizedBox(width: 8),
                                    Text('BUSCAR'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
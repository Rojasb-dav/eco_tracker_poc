import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcoLog(),
    );
  }
}

class EcoLog extends StatefulWidget {
  const EcoLog({super.key});

  @override
  State<EcoLog> createState() => _EcoLogState();
}

class _EcoLogState extends State<EcoLog> {
  final List<String> _data = <String>[];
  final TextEditingController _input = TextEditingController();

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  void _addItem() {
    final text = _input.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _data.add(text);
      _input.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevOps PoC: Android & Windows'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _input,
              decoration: const InputDecoration(
                labelText: 'Nombre del Punto',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _addItem(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addItem,
                child: const Text('Registrar'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_data[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

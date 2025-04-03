import 'package:flutter/material.dart';
import 'database_helper.dart';

class CadastroClienteScreen extends StatefulWidget {
  @override
  _CadastroClienteScreenState createState() => _CadastroClienteScreenState();
}

class _CadastroClienteScreenState extends State<CadastroClienteScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();

  Future<void> _salvarCliente() async {
    Map<String, dynamic> cliente = {
      'nome': nomeController.text,
      'telefone': telefoneController.text,
      'endereco': enderecoController.text,
    };
    await DatabaseHelper.instance.insertCliente(cliente);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome')),
            TextField(
                controller: telefoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Telefone')),
            TextField(
                controller: enderecoController,
                decoration: InputDecoration(labelText: 'Endereço')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _salvarCliente, child: Text('Salvar Cliente')),
          ],
        ),
      ),
    );
  }
}

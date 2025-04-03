import 'package:flutter/material.dart';
import 'database_helper.dart';

class CadastroServicoScreen extends StatefulWidget {
  @override
  _CadastroServicoScreenState createState() => _CadastroServicoScreenState();
}

class _CadastroServicoScreenState extends State<CadastroServicoScreen> {
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController dataController = TextEditingController();
  final TextEditingController horasController = TextEditingController();
  final TextEditingController valorUnitarioController = TextEditingController();

  Future<void> _salvarServico() async {
    double valorUnitario = double.tryParse(valorUnitarioController.text) ?? 0;
    int horas = int.tryParse(horasController.text) ?? 0;
    double valorTotal = valorUnitario * horas;

    Map<String, dynamic> servico = {
      'descricao': descricaoController.text,
      'data': dataController.text,
      'horas': horas,
      'valor_unitario': valorUnitario,
      'valor_total': valorTotal,
    };

    await DatabaseHelper.instance.insertServico(servico);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Serviço')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: dataController,
              decoration: InputDecoration(labelText: 'Data'),
            ),
            TextField(
              controller: horasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantidade de Horas'),
            ),
            TextField(
              controller: valorUnitarioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor Unitário'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarServico,
              child: Text('Salvar Serviço'),
            ),
          ],
        ),
      ),
    );
  }
}

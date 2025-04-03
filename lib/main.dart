import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'cadastrocliente.dart';
import 'cadastroservico.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestão de Clientes e Serviços')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CadastroClienteScreen()),
                );
              },
              child: Text('Cadastrar Cliente'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CadastroServicoScreen()),
                );
              },
              child: Text('Cadastrar Serviço'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListaClientesScreen()),
                );
              },
              child: Text('Listar Clientes'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListaServicosScreen()),
                );
              },
              child: Text('Listar Serviços'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaClientesScreen extends StatefulWidget {
  @override
  _ListaClientesScreenState createState() => _ListaClientesScreenState();
}

class _ListaClientesScreenState extends State<ListaClientesScreen> {
  List<Map<String, dynamic>> clientes = [];

  @override
  void initState() {
    super.initState();
    _carregarClientes();
  }

  Future<void> _carregarClientes() async {
    final data = await DatabaseHelper.instance.getClientes();
    setState(() {
      clientes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Clientes')),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          final cliente = clientes[index];
          return ListTile(
            title: Text(cliente['nome']),
            subtitle: Text('Telefone: ${cliente['telefone']}'),
          );
        },
      ),
    );
  }
}

class ListaServicosScreen extends StatefulWidget {
  @override
  _ListaServicosScreenState createState() => _ListaServicosScreenState();
}

class _ListaServicosScreenState extends State<ListaServicosScreen> {
  List<Map<String, dynamic>> servicos = [];

  @override
  void initState() {
    super.initState();
    _carregarServicos();
  }

  Future<void> _carregarServicos() async {
    final data = await DatabaseHelper.instance.getServicos();
    setState(() {
      servicos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Serviços')),
      body: ListView.builder(
        itemCount: servicos.length,
        itemBuilder: (context, index) {
          final servico = servicos[index];
          return ListTile(
            title: Text(servico['descricao']),
            subtitle: Text(
                'Data: ${servico['data']} - Horas: ${servico['horas']} - Valor: R\$${servico['valor_unitario']}'),
          );
        },
      ),
    );
  }
}

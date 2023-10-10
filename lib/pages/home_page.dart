import 'package:crud_padaria/pages/cadastro.dart';
import 'package:crud_padaria/pages/consulta.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> body = const[
    CadastroPage(),
    ConsultaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber[800],
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Cadastrar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Consultar",
          ),
        ]
      ),
    );
  }
}

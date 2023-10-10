import 'package:crud_padaria/pages/cadastro.dart';
import 'package:crud_padaria/pages/consulta.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int indexAtual = 0;

    List<Widget> pages = [
      CadastroPage(),
      ConsultaPage(),
    ];

    void itemClicado(int index) {
      setState(() {
        indexAtual = index;
      });
      print(indexAtual);
      print(pages[indexAtual]);
    }

    return Scaffold(
        body: pages[indexAtual],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexAtual,
          onTap: itemClicado,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Adicionar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted), label: "Produtos"),
          ],
        ));
  }
}

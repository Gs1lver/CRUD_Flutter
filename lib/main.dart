import 'package:crud_padaria/pages/cadastro.dart';
import 'package:crud_padaria/pages/consulta.dart';
import 'package:crud_padaria/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/cadastro": (context) => const CadastroPage(),
        "/consulta": (context) => const ConsultaPage(),
      },
    );
  }
}

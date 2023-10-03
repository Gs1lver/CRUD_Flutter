import 'package:flutter/material.dart';

class ConsultaPage extends StatefulWidget {
  const ConsultaPage({super.key});

  @override
  State<ConsultaPage> createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 226, 230),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Oi")
            ],
          ),
        ),
      ),
    );
  }
}
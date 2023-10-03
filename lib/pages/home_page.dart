import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crud_padaria/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //ISA CENTRALIZA A DIV =´´(

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Bem vindo à Padaria Dona Maria!"),
              Text("O que deseja fazer?"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/cadastro");
                },
                child: const Text("Cadastrar produtos"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/consulta");
                },
                child: const Text("Consultar produtos"),
              ),
            ],
          ),
        ),
      )
    );
  }
}
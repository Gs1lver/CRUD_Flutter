import 'package:crud_padaria/controller/produto_controller.dart';
import 'package:crud_padaria/model/produto.dart';
import 'package:crud_padaria/widgets/radioAvailable.dart';
import 'package:flutter/material.dart';

class AlteraPage extends StatefulWidget {
  Produto produto;
  int indice;

  AlteraPage({super.key, required this.produto, required this.indice});

  @override
  State<AlteraPage> createState() => _AlteraPageState();
}

class _AlteraPageState extends State<AlteraPage> {
  @override
  Widget build(BuildContext context) {
    final ProdutoController _produtoController = ProdutoController();
    List listaProdutos = ProdutoController.getListaProdutos;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // _produtoController.alterarProduto(
              //     listaProdutos[0], "Pão de Queijo", 2.50);
              // Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nome",
                      hintText: "Digite o nome do produto",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Preço",
                      hintText: "Digite o preço do produto",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),

                  //radio de tipo

                  const Divider(
                    thickness: 1,
                  ),
                  //radio de disponibilidade
                  RadioAvailable()
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

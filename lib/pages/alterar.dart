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
  final ProdutoController _produtoController = ProdutoController();
  List listaProdutos = ProdutoController.getListaProdutos;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  //trazer o tipo e disponibilidade do produto
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void inicializaCampos() {
    _nomeController.text = widget.produto.name;
    _precoController.text = widget.produto.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    inicializaCampos();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _produtoController.alteraProduto(
                    widget.indice,
                    _nomeController.text,
                    double.parse(_precoController.text),
                    widget.produto.types,
                    widget.produto.isAvailable);
                
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: "Nome",
                    hintText: "Digite o nome do produto",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _precoController,
                  decoration: const InputDecoration(
                    labelText: "Preço",
                    hintText: "Digite o preço do produto",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),

                //radio de tipo

                //radio de disponibilidade
                RadioAvailable()
              ],
            )),
          )
        ],
      ),
    );
  }
}

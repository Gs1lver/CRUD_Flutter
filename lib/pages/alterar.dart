import 'package:crud_padaria/controller/produto_controller.dart';
import 'package:crud_padaria/model/produto.dart';
import 'package:flutter/material.dart';

class AlteraPage extends StatefulWidget {
  final Produto produto;
  final int indice;

  AlteraPage({super.key, required this.produto, required this.indice});

  @override
  State<AlteraPage> createState() => _AlteraPageState();
}

class _AlteraPageState extends State<AlteraPage> {
  final ProdutoController _produtoController = ProdutoController();
  List listaProdutos = ProdutoController.getListaProdutos;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void inicializaCampos() {
    _nomeController.text = widget.produto.name;
    _precoController.text = widget.produto.price.toString();
    _descriptionController.text = widget.produto.description;
    _ratingController.text = widget.produto.rating.toString();
  }

  @override
  Widget build(BuildContext context) {
    inicializaCampos();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.network("https://cdn-icons-png.flaticon.com/512/992/992747.png", width: 180, height: 180)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
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
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _descriptionController,
                       decoration: const InputDecoration(
                        labelText: "Descrição",
                        hintText: "Digite uma descrição para o produto",
                       
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite uma descrição para o produto!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _ratingController,
                      decoration: const InputDecoration(
                        labelText: "Avaliação",
                        hintText: "Digite a avaliação do produto",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite a avaliação do produto!";
                        }
                        return null;
                      },
                    ),
                  ],
                )
              ),
            ),
            ElevatedButton(
              onPressed: (){
                if (_formKey.currentState!.validate()) {
                  String name = _nomeController.text;
                  double price = double.parse(_precoController.text);
                  String description = _descriptionController.text;
                  double rating = double.parse(_ratingController.text);

                  _produtoController.alteraProduto(widget.indice, name, price, description, rating);
                  Navigator.pop(context,);
                }
              },
              child: const Text("Alterar"),
            )
          ],
        ),
      ),
    );
  }
}

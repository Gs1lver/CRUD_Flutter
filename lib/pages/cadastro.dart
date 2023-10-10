import 'package:flutter/material.dart';
import 'package:crud_padaria/controller/produto_controller.dart';
import '../model/produto.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final ProdutoController _produtoController = ProdutoController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void limparCampos() {
    _nameController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _ratingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Cadastro de Produtos"),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                Navigator.pushNamed(context, '/consulta');
              },
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //imagem
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/paes.png", width: 180, height: 180)),

            //cadastro
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 16, left: 16, right: 16),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: "Nome",
                          hintText: "Digite o nome do produto",
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite o nome do produto!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _priceController,
                        decoration: const InputDecoration(
                          labelText: "Preço",
                          hintText: "Digite o preço do produto",
                         
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite o preço do produto!";
                          }
                          return null;
                        },
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
                      const SizedBox(height: 16),
                      //Botão cadastrar
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[800],
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String name = _nameController.text;
                            double price = double.parse(_priceController.text);
                            String description = _descriptionController.text;
                            double rating = double.parse(_ratingController.text);

                            Produto produto = Produto(name: name, price: price, description: description, rating: rating);
                            _produtoController.adicionarProduto(produto);
                            
                            limparCampos();
                            _formKey.currentState!.reset();
                          }
                        },
                        child: const Text("Cadastrar", style: TextStyle(fontSize: 16)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

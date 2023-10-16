import 'package:flutter/material.dart';
import 'package:crud_padaria/controller/produto_controller.dart';
import 'package:flutter/services.dart';
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

  final RegExp priceRegExp = RegExp(r'^\d{1,5}([\.,]\d{0,2})?$');

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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Informações"),
                    content: const Text("Nos campos preço e avaliação, utilize o ponto (.) para separar as casas decimais."),
                    actions: [
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            )
        ],
      ),
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
              padding: const EdgeInsets.only(
                  top: 4, bottom: 16, left: 16, right: 16),
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
                            prefixIcon: Icon(Icons.shopping_bag)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite o nome do produto!";
                          } else if (value.length < 3) {
                            return "O nome deve ter pelo menos 3 caracteres!";
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
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(priceRegExp),
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite o preço do produto!";
                          } else if (double.parse(value) < 0) {
                            return "O preço deve ser maior que zero!";
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
                          prefixIcon: Icon(Icons.description),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite uma descrição para o produto!";
                          } else if (value.length < 3) {
                            return "A descrição deve ter pelo menos 3 caracteres!";
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
                          prefixIcon: Icon(Icons.star),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(priceRegExp),
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite a avaliação do produto!";
                          } else if (double.parse(value) < 0 ||
                              double.parse(value) > 5) {
                            return "A avaliação deve estar entre 0 e 5";
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
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String name = _nameController.text;
                            double price = double.parse(
                                _priceController.text.replaceAll(",", "."));
                            String description = _descriptionController.text;
                            double rating =
                                double.parse(_ratingController.text);

                            Produto produto = Produto(
                                name: name,
                                price: price,
                                description: description,
                                rating: rating);
                            _produtoController.adicionarProduto(produto);

                            limparCampos();
                            _formKey.currentState!.reset();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Produto cadastrado!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: const Text("Cadastrar",
                            style: TextStyle(fontSize: 16)),
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

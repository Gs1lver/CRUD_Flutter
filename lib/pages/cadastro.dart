import 'package:crud_padaria/widgets/radioAvailable.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void limparCampos() {
    _nameController.clear();
    _priceController.clear();
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
              padding: const EdgeInsets.all(16.0),
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
                      Divider(thickness: 1,),

                      Text("Tipo:", style: TextStyle(fontSize: 16), textAlign: TextAlign.left,),
                      DropdownButton(
                        items: const [
                          DropdownMenuItem(child: Text("Pao"), value: "Pao"),
                          DropdownMenuItem(
                              child: Text("Salgado"), value: "Salgado"),
                          DropdownMenuItem(child: Text("Doce"), value: "Doce"),
                          DropdownMenuItem(
                              child: Text("Bebida"), value: "Bebida"),
                          DropdownMenuItem(
                              child: Text("Outro"), value: "Outro"),
                        ],
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                      Divider(thickness: 1,),
                      Text("Disponibilidade:"),
                      const RadioAvailable(),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String name = _nameController.text;
                            int price = int.parse(_priceController.text);
                            limparCampos();
                            _formKey.currentState!.reset();
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

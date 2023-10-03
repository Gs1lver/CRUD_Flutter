import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

/*List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Pão"),value: "Pao"),
    DropdownMenuItem(child: Text("Salgado"),value: "Salgado"),
    DropdownMenuItem(child: Text("Doce"),value: "Doce"),
    DropdownMenuItem(child: Text("Bebida"),value: "Bebida"),
    DropdownMenuItem(child: Text("Outro"),value: "Outro"),
  ];
  return menuItems;
}*/

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
      backgroundColor: Color.fromARGB(255, 222, 226, 230),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //imagem
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/paes.png", width: 100, height: 100)
              ),
              Text("Cadastre um produto aqui"),
              //cadastro
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: "Nome",
                            hintText: "Digite o nome do produto",
                            hintStyle: TextStyle(color: Colors.grey),
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
                            hintStyle: TextStyle(color: Colors.grey),
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
                        DropdownButton(
                          items: const[
                            DropdownMenuItem(child: Text("Pao"), value: "Pao"),
                            DropdownMenuItem(child: Text("Salgado"), value: "Salgado"),
                            DropdownMenuItem(child: Text("Doce"), value: "Doce"),
                            DropdownMenuItem(child: Text("Bebida"), value: "Bebida"),
                            DropdownMenuItem(child: Text("Outro"), value: "Outro"),
                          ],
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        DropdownButton(
                          items: const[
                            DropdownMenuItem(child: Text("Disponível"), value: 0),
                            DropdownMenuItem(child: Text("Indisponível"), value: 1)
                          ],
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        ElevatedButton.icon(
                          label: const Text("Cadastrar Produto"),
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String name = _nameController.text;
                              int price = int.parse(_priceController.text);
                              limparCampos();
                              _formKey.currentState!.reset();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
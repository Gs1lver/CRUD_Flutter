import 'package:crud_padaria/controller/produto_controller.dart';
import 'package:crud_padaria/model/produto.dart';
import 'package:crud_padaria/pages/alterar.dart';
import 'package:flutter/material.dart';

class ConsultaPage extends StatefulWidget {
  const ConsultaPage({super.key});

  @override
  State<ConsultaPage> createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
  final listaProdutos = ProdutoController.getListaProdutos;
  List<Produto> listaBusca = [];
  final busca = "";

  @override
  void initState() {
    listaBusca = List.from(listaProdutos);
    super.initState();
  }

  void atualizaLista(String nome) {
    setState(() {
      listaBusca = listaProdutos
          .where((element) =>
              element.name.toLowerCase().contains(nome.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nossos Produtos"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Buscar",
                    hintText: "Digite o nome do produto",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onChanged: (String nome) {
                    atualizaLista(nome);
                  }),
            ),
            const Divider(
              thickness: 1,
            ),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: listaBusca.length,
                separatorBuilder: (context, int index) => const Divider(
                  thickness: 1,
                ),
                itemBuilder: (context, int index) {
                  return ListTile(
                      leading: Icon(Icons.cookie), //se tiver disponivel, aparecer x icone, se nao, aparecer y icone
                      title: Text(listaBusca[index].name),
                      subtitle:
                          Text("R\$${listaBusca[index].price.toString()}"),
                      trailing: SizedBox(
                        width: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AlteraPage(
                                                produto: listaProdutos[index],
                                                indice: index,
                                              )));
                                },
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  Produto produto = listaProdutos[index];
                                  setState(() {
                                    confirmarExclusao(context, produto);
                                    atualizaLista(busca);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future confirmarExclusao(BuildContext context, Produto produto) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Excluir ${produto.name}?'), //excluir o nome do produto
        content: const SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Esta ação não poderá ser desfeita.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Excluir'),
            onPressed: () {
              ProdutoController.excluirProduto(produto);
              Navigator.of(context).pop();
              

            },
          ),
        ],
      );
    },
  );
}

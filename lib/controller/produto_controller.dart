import 'package:crud_padaria/model/produto.dart';

class ProdutoController {

  //atributos
  static List<Produto> _listaProdutos = [
    Produto(isAvailable: false, name: "Pão de Queijo", price: 3.99, types: [Type.salgado]),
    Produto(isAvailable: true, name: "Guaraná", price: 6.99, types: [Type.bebida]),
    Produto(isAvailable: true, name: "Doce de Leite", price: 4.99, types: [Type.doce]),
    Produto(isAvailable: false, name: "Pão de Leite", price: 5.99, types: [Type.pao]),
  ];

  //getters e setters
  static List<Produto> get getListaProdutos => _listaProdutos;
  set listaProdutos(value) => _listaProdutos = value;

  //métodos
  void adicionarProduto(Produto produto) {
    _listaProdutos.add(produto);
  }

  static void excluirProduto(Produto produto){
    _listaProdutos.remove(produto);
  }

  void alteraProduto(int indice, String nome, double preco, List<Type> tipos, bool disponibilidade) {
    _listaProdutos[indice].name = nome;
    _listaProdutos[indice].price = preco;
    _listaProdutos[indice].types = tipos;
    _listaProdutos[indice].isAvailable = disponibilidade;
  }
}
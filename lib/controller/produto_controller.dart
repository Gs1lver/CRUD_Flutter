import 'package:crud_padaria/model/produto.dart';

class ProdutoController {

  //atributos
  static List<Produto> _listaProdutos = [
    Produto(name: "Pão de Queijo", price: 3.99, description: "Vindo direto de Minas", rating: 4.5),
    Produto(name: "Guaraná", price: 6.99, description: "refrizin delicia", rating: 3.0),
    Produto(name: "Doce de Leite", price: 4.99, description: "doce de leite caseiro", rating: 5.0),
    Produto(name: "Pão de Leite", price: 5.99, description: "pão feito especialmente pela vó tereza", rating: 4.5),
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

  void alteraProduto(int indice, String nome, double preco, String descricao, double avaliacao) {
    _listaProdutos[indice].name = nome;
    _listaProdutos[indice].price = preco;
    _listaProdutos[indice].description = descricao;
    _listaProdutos[indice].rating = avaliacao;
  }
}
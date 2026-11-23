// Regras de navegação da lista de palavras (lista circular).
//
// Ficam fora do widget para poderem ser testadas como funções puras
// (test/navegacao_test.dart).

/// Índice da próxima palavra: depois da última, volta para a primeira.
int proximoIndice(int atual, int total) {
  if (total <= 0) {
    throw ArgumentError.value(total, 'total', 'a lista não pode estar vazia');
  }
  return (atual + 1) % total;
}

/// Índice da palavra anterior: antes da primeira, vai para a última.
int indiceAnterior(int atual, int total) {
  if (total <= 0) {
    throw ArgumentError.value(total, 'total', 'a lista não pode estar vazia');
  }
  return (atual - 1 + total) % total;
}

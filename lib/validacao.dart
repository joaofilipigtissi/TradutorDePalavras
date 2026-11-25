/// Regras de validação das palavras.
///
/// Ficam fora do widget para poderem ser testadas
/// como funções puras (test/validacao_test.dart).

/// Verifica se a palavra possui traduções preenchidas
/// em português, inglês e francês.
bool palavraValida(String portugues, String ingles, String frances) {
  if (portugues.trim().isEmpty ||
      ingles.trim().isEmpty ||
      frances.trim().isEmpty) {
    return false;
  }

  return true;
}

import 'package:flutter_test/flutter_test.dart';

import 'package:tradutor_palavras/validacao.dart';

// Teste de regra de negócio: validação de palavras.
void main() {
  group('palavraValida', () {
    test('retorna verdadeiro quando todas as traduções estão preenchidas', () {
      expect(palavraValida('Casa', 'House', 'Maison'), true);
    });

    test('retorna falso quando uma tradução está vazia', () {
      expect(palavraValida('Casa', '', 'Maison'), false);
    });

    test('retorna falso quando uma tradução contém apenas espaços', () {
      expect(palavraValida('Casa', '   ', 'Maison'), false);
    });
  });
}

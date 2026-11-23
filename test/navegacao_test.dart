import 'package:flutter_test/flutter_test.dart';

import 'package:tradutor_palavras/navegacao.dart';

// Teste de regra de negócio (Aula 2, tarefa 3): navegação circular.
void main() {
  group('proximoIndice', () {
    test('avança uma posição no meio da lista', () {
      expect(proximoIndice(3, 11), 5);
    });

    test('depois da última palavra volta para a primeira', () {
      expect(proximoIndice(10, 11), 0);
    });

    test('rejeita lista vazia', () {
      expect(() => proximoIndice(0, 0), throwsArgumentError);
    });
  });

  group('indiceAnterior', () {
    test('volta uma posição no meio da lista', () {
      expect(indiceAnterior(4, 11), 3);
    });

    test('antes da primeira palavra vai para a última', () {
      expect(indiceAnterior(0, 11), 10);
    });

    test('rejeita lista vazia', () {
      expect(() => indiceAnterior(0, 0), throwsArgumentError);
    });
  });
}

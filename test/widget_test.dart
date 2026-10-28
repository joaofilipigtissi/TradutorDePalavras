import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tradutor_palavras/main.dart';

void main() {
  testWidgets('mostra a primeira palavra sem tradução', (tester) async {
    await tester.pumpWidget(const TradutorApp());

    expect(find.text('Casa'), findsOneWidget);
    expect(find.text('Inglês: House'), findsNothing);
    expect(find.text('Francês: Maison'), findsNothing);
  });

  testWidgets('"Mostrar tradução" exibe as duas traduções', (tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.widgetWithText(ElevatedButton, 'Mostrar tradução'));
    await tester.pump();

    expect(find.text('Inglês: House'), findsOneWidget);
    expect(find.text('Francês: Maison'), findsOneWidget);
  });

  testWidgets('"Próxima" avança e esconde a tradução', (tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.widgetWithText(ElevatedButton, 'Mostrar tradução'));
    await tester.pump();
    await tester.tap(find.widgetWithText(ElevatedButton, 'Próxima'));
    await tester.pump();

    expect(find.text('Cachorro'), findsOneWidget);
    expect(find.text('Inglês: Dog'), findsNothing);
  });

  testWidgets('"Anterior" na primeira palavra volta para a última (lista circular)',
      (tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.widgetWithText(ElevatedButton, 'Anterior'));
    await tester.pump();

    expect(find.text(palavras.last.principal), findsOneWidget);
  });

  test('a lista tem pelo menos 10 palavras', () {
    expect(palavras.length, greaterThanOrEqualTo(10));
  });
}

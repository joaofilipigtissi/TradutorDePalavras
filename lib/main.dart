import 'package:flutter/material.dart';

// Modelo simples que representa uma palavra e suas duas traduções.
class Palavra {
  final String principal;
  final String traducao1;
  final String traducao2;

  const Palavra(this.principal, this.traducao1, this.traducao2);
}

// Línguas utilizadas na atividade.
const String idiomaPrincipal = 'Português';
const String idiomaSecundario = 'Inglês';
const String idiomaTerciario = 'Francês';

// Lista de palavras (mínimo de 10 exigido pela atividade).
const List<Palavra> palavras = [
  Palavra('Casa', 'House', 'Maison'),
  Palavra('Cachorro', 'Dog', 'Chien'),
  Palavra('Livro', 'Book', 'Livre'),
  Palavra('Água', 'Water', 'Eau'),
  Palavra('Sol', 'Sun', 'Soleil'),
  Palavra('Lua', 'Moon', 'Lune'),
  Palavra('Amigo', 'Friend', 'Ami'),
  Palavra('Escola', 'School', 'École'),
  Palavra('Comida', 'Food', 'Nourriture'),
  Palavra('Tempo', 'Time', 'Temps'),
  Palavra('Cidade', 'City', 'Ville'),
];

void main() {
  runApp(const TradutorApp());
}

class TradutorApp extends StatelessWidget {
  const TradutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tradutor de Palavras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const TradutorScreen(),
    );
  }
}

class TradutorScreen extends StatefulWidget {
  const TradutorScreen({super.key});

  @override
  State<TradutorScreen> createState() => _TradutorScreenState();
}

class _TradutorScreenState extends State<TradutorScreen> {
  // Índice da palavra atualmente exibida.
  int currentIndex = 0;

  // Controla se as traduções da palavra atual estão visíveis.
  bool mostrandoTraducao = false;

  // Mostra as duas traduções da palavra atual.
  void mostrarTraducao() {
    setState(() {
      mostrandoTraducao = true;
    });
  }

  // Avança para a próxima palavra (lista circular) e esconde as traduções.
  void proximaPalavra() {
    setState(() {
      currentIndex = (currentIndex + 1) % palavras.length;
      mostrandoTraducao = false;
    });
  }

  // Volta para a palavra anterior (lista circular) e esconde as traduções.
  void palavraAnterior() {
    setState(() {
      currentIndex = (currentIndex - 1 + palavras.length) % palavras.length;
      mostrandoTraducao = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final palavraAtual = palavras[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tradutor de Palavras'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Palavra principal (sempre visível).
              Text(
                palavraAtual.principal,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Traduções: só aparecem depois de "Mostrar tradução".
              if (mostrandoTraducao) ...[
                Text(
                  '$idiomaSecundario: ${palavraAtual.traducao1}',
                  style: const TextStyle(fontSize: 24, color: Colors.teal),
                ),
                const SizedBox(height: 8),
                Text(
                  '$idiomaTerciario: ${palavraAtual.traducao2}',
                  style: const TextStyle(fontSize: 24, color: Colors.indigo),
                ),
              ] else
                const SizedBox(height: 64),

              const SizedBox(height: 40),

              // Botões de navegação e exibição da tradução.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: palavraAnterior,
                    child: const Text('Anterior'),
                  ),
                  ElevatedButton(
                    onPressed: mostrarTraducao,
                    child: const Text('Mostrar tradução'),
                  ),
                  ElevatedButton(
                    onPressed: proximaPalavra,
                    child: const Text('Próxima'),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              Text(
                'Palavra ${currentIndex + 1} de ${palavras.length}  •  '
                '$idiomaPrincipal / $idiomaSecundario / $idiomaTerciario',
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

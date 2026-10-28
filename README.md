# Tradutor de Palavras

Aplicativo Flutter de tela única desenvolvido para o curso de Engenharia de Software da
Católica SC, na disciplina "Desenvolvimento de Dispositivos Móveis".

O app apresenta uma palavra em **Português** e permite ver suas traduções em **Inglês** e
**Francês**, com navegação entre uma lista de 11 palavras (lista circular: depois da última
volta para a primeira, e vice-versa).

## Funcionalidades

- Exibe a palavra atual em português.
- Botão **Mostrar tradução**: exibe as traduções em inglês e francês.
- Botões **Anterior** e **Próxima**: navegam pela lista (circular) e escondem a tradução.
- Indicador "Palavra X de N".

## Stack

| Item | Tecnologia |
|---|---|
| Linguagem | Dart 3 |
| Framework | Flutter 3 (Material 3) |
| Testes | `flutter_test` (testes de widget) |
| Análise estática | `flutter_lints` (`analysis_options.yaml`) |
| Plataformas | Android, iOS, Web, Linux, macOS e Windows |
| Lockfile | `pubspec.lock` (versões exatas das dependências) |

## Estrutura

```
lib/main.dart          # app completo: modelo Palavra, lista de palavras e tela
test/widget_test.dart  # testes de widget
pubspec.yaml           # dependências
pubspec.lock           # versões exatas (versionado)
android/ ios/ web/ linux/ macos/ windows/   # projetos nativos gerados pelo Flutter
```

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.x (com Dart 3) — confira com `flutter --version`
- Para Android: Android Studio + SDK do Android, ou um dispositivo físico
- Para Web: Google Chrome

Verifique o ambiente com:

```bash
flutter doctor
```

## Como instalar

```bash
git clone https://github.com/joaofilipigtissi/TradutorDePalavras.git
cd TradutorDePalavras
flutter pub get
```

## Como executar

```bash
flutter run              # escolhe o dispositivo conectado
flutter run -d chrome    # no navegador
```

## Como rodar os testes

```bash
flutter analyze   # análise estática (lints)
flutter test      # testes de widget em test/
```

## Variáveis de ambiente

O app não usa variáveis de ambiente hoje. O arquivo `.env.example` existe como modelo:
se algum dia houver configuração sensível (por exemplo, chave de uma API de tradução),
declare o **nome** da variável lá e coloque o valor real só no `.env`, que não é versionado.

## Como contribuir

A branch `main` é protegida: toda mudança entra por **Pull Request** com 1 aprovação e
*squash merge*.

1. Abra (ou escolha) uma Issue usando os modelos de **Funcionalidade** ou **Defeito**.
2. Crie uma branch a partir da `main`: `git switch -c feat/nome-curto`.
3. Faça os commits e envie: `git push -u origin feat/nome-curto`.
4. Abra o Pull Request; o título segue [Conventional Commits](https://www.conventionalcommits.org/pt-br/)
   (`feat: ...`, `fix: ...`, `docs: ...`), pois ele vira a mensagem do commit na `main`.
5. Aguarde a revisão do par antes do merge.

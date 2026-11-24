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
| Framework | Flutter **3.47.9** (Material 3), versão fixa no CI/CD |
| Testes | `flutter_test` (testes de widget e de regra de negócio) |
| Análise estática | `flutter_lints` (`analysis_options.yaml`) |
| Plataformas | Android, iOS, Web, Linux, macOS e Windows |
| Lockfile | `pubspec.lock` (versões exatas das dependências) |

## Estrutura

```
lib/main.dart              # modelo Palavra, lista de palavras e tela
lib/navegacao.dart         # regras da lista circular (próxima / anterior)
test/widget_test.dart      # testes de widget
test/navegacao_test.dart   # testes de regra de negócio da navegação
pubspec.yaml               # dependências
pubspec.lock               # versões exatas (versionado)
.github/workflows/         # pipelines: ci.yml, pr-titulo.yml, cd.yml, rollback.yml
scripts/proxima-versao.mjs # calcula a próxima versão SemVer a partir dos commits
android/ ios/ web/ linux/ macos/ windows/   # projetos nativos gerados pelo Flutter
```

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **3.47.9** (Dart 3.13), a mesma versão do CI.
  Confira com `flutter --version`. Com outra versão, o `pubspec.lock` pode não ser aceito.
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
flutter pub get --enforce-lockfile
```

## Como executar

```bash
flutter run              # escolhe o dispositivo conectado
flutter run -d chrome    # no navegador
```

## Como rodar os testes

```bash
flutter analyze           # análise estática (lints)
flutter test --coverage   # testes em test/ + relatório em coverage/lcov.info
```

## Pipeline (CI/CD)

| Workflow | Quando roda | O que faz |
|---|---|---|
| `ci.yml` | todo PR para a `main` | lint, testes, cobertura mínima de 60%, build web e análise de dependências; o check `ci-ok` resume tudo |
| `pr-titulo.yml` | todo PR para a `main` | exige título em Conventional Commits (check `titulo-pr`) |
| `cd.yml` | merge na `main` | calcula a versão, gera o pacote uma única vez, passa por *staging* e, depois de aprovado no Environment `production`, cria a tag `vX.Y.Z` e a Release |
| `rollback.yml` | manual (aba Actions) | volta a versão oficial para uma tag anterior, usando o pacote da Release |

A versão sai do título do PR: `feat` → versão *minor* (1.**1**.0), `fix` → *patch*
(1.0.**1**), e `docs`, `chore`, `ci`, `test` não geram versão. PRs que só alteram `.md`
ou `docs/` nem disparam o CD.

## Variáveis de ambiente

O app não usa variáveis de ambiente hoje. O arquivo `.env.example` existe como modelo:
se algum dia houver configuração sensível (por exemplo, chave de uma API de tradução),
declare o **nome** da variável lá e coloque o valor real só no `.env`, que não é versionado.

## Como contribuir

A branch `main` é protegida: toda mudança entra por **Pull Request** com 1 aprovação e
*squash merge*.

1. Abra (ou escolha) uma Issue usando os modelos de **Funcionalidade** ou **Defeito**.
2. Crie uma branch a partir da `main` atualizada, com o número da Issue:
   `git switch -c feature/<issue>-<descricao>` (ex.: `feature/7-corrige-botao`).
3. Faça os commits e envie: `git push -u origin feature/<issue>-<descricao>`.
4. Abra o Pull Request; o título segue [Conventional Commits](https://www.conventionalcommits.org/pt-br/)
   (`feat: ...`, `fix: ...`, `docs: ...`), pois ele vira a mensagem do commit na `main`.
5. Escreva `Closes #<issue>` na descrição do PR e aguarde os checks `ci-ok` e
   `titulo-pr` ficarem verdes e a revisão do par antes do merge.

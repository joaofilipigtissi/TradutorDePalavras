# Guia de onboarding — Tradutor de Palavras

Este guia basta para você instalar o app, rodar os testes e abrir o seu primeiro Pull Request
sem precisar perguntar nada a ninguém (PGC 12).

## 1. Ambiente

Você precisa de:

- **Git**
- **Flutter 3.47.9** (com Dart 3.13), a mesma versão usada no CI. Com outra versão, o
  `pubspec.lock` pode ser recusado.
- **Google Chrome**, para rodar o app no navegador (o jeito mais rápido)

Confira:

```bash
git --version
flutter --version   # deve mostrar "Flutter 3.47.9"
flutter doctor      # aponta o que falta no ambiente
```

> Se você tem outra versão do Flutter instalada, troque com `flutter downgrade` / `flutter upgrade`
> ou use o [FVM](https://fvm.app/): `fvm use 3.47.9`.

## 2. Baixar, rodar e testar

```bash
git clone https://github.com/joaofilipigtissi/TradutorDePalavras.git
cd TradutorDePalavras

flutter pub get --enforce-lockfile   # instala exatamente as versões do pubspec.lock
flutter run -d chrome                # abre o app no navegador
```

Antes de abrir um PR, rode o mesmo que o CI roda:

```bash
flutter analyze           # lint: deve terminar com "No issues found!"
flutter test --coverage   # testes: deve terminar com "N tests passed", sem falhas
```

Onde fica cada coisa:

| Arquivo | Conteúdo |
|---|---|
| `lib/main.dart` | lista de palavras e a tela |
| `lib/navegacao.dart` | regras da lista circular (próxima / anterior) |
| `test/` | testes de widget e de regra de negócio |
| `.github/workflows/` | pipelines (CI, título do PR, CD, rollback) |

## 3. Seu primeiro Pull Request

A `main` é protegida: ninguém faz `push` direto nela, nem o dono do repositório.

1. **Issue:** abra uma em **Issues → New issue** com o modelo *Funcionalidade* ou *Defeito*
   (ou escolha uma aberta). Anote o número, por exemplo `#15`.
2. **Branch** a partir da `main` atualizada, com o número da Issue:
   ```bash
   git switch main && git pull
   git switch -c feature/15-corrige-onboarding
   ```
3. **Commits** pequenos, em [Conventional Commits](https://www.conventionalcommits.org/pt-br/):
   ```bash
   git add .
   git commit -m "docs: corrige o comando de instalação no onboarding"
   git push -u origin feature/15-corrige-onboarding
   ```
4. **Abra o PR** pelo link que o `git push` mostra (ou pelo botão *Compare & pull request*).
   - O **título** também segue Conventional Commits. Ele vira o commit na `main` e decide a
     próxima versão: `feat` → 1.**1**.0, `fix` → 1.0.**1**; `docs`, `chore`, `ci` e `test`
     não geram versão.
   - Preencha o template (Contexto / Decisão / Como testar) e escreva `Closes #15`.
5. **Peça a revisão** em *Reviewers*. O merge exige 1 aprovação e os checks verdes, e é
   feito com **Squash and merge**.

## 4. Lendo o resultado do pipeline

No fim da página do PR aparecem os checks:

| Check | O que verifica | Se ficar vermelho |
|---|---|---|
| `titulo-pr` | título do PR em Conventional Commits | edite o título do PR (o check roda de novo sozinho) |
| `Lint, testes e build` | `flutter analyze`, testes, cobertura ≥ 60% e `flutter build web` | clique em **Details** e veja o passo que falhou |
| `Análise de dependências (SCA)` | vulnerabilidade **crítica** nova nas dependências | veja o pacote apontado e atualize-o |
| `ci-ok` | resumo: todos os jobs acima passaram | olhe qual job falhou acima dele |

Se o GitHub disser que a branch está desatualizada, clique em **Update branch** (a revisão
precisa ser feita de novo depois disso).

## 5. Depois do merge

O workflow **CD** roda sozinho na aba **Actions**: calcula a versão, gera o pacote e passa por
*staging*. A produção (tag `vX.Y.Z` + Release com o pacote) espera a aprovação do dono do
repositório em **Review deployments**. As versões ficam em **Releases**.

## 6. Onde pedir ajuda

- Dúvida ou problema no guia: abra uma Issue com o modelo *Defeito*, ou um PR `docs: ...`
  corrigindo o trecho confuso.
- Prazo de revisão de PRs: até 3 dias úteis (PGC 2.1).

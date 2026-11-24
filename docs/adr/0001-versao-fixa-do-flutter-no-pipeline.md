# 0001 — Versão fixa do Flutter (3.47.9) no CI e no CD

- Status: aceito
- Data: 24/11/2026

## Contexto

O `pubspec.lock` é item de configuração (PGC 4.1) e o CI instala as dependências com
`flutter pub get --enforce-lockfile`, o equivalente ao `npm ci`: falha se o lockfile não
bater com o ambiente, em vez de atualizá-lo em silêncio.

Alguns pacotes do lockfile (`test_api`, `clock`, `vector_math`...) têm versão **definida pelo
próprio SDK do Flutter**. Na primeira execução do CI, com o canal `stable` sem versão
(Flutter 3.50.1), o `pub get` falhou: o SDK novo exige `test_api` diferente da registrada no
lockfile. Ou seja, o resultado do pipeline dependia do dia em que ele rodava.

## Decisão

O CI (`ci.yml`) e o CD (`cd.yml`) usam `subosito/flutter-action` com
`flutter-version: '3.47.9'`, a versão compatível com o `pubspec.lock` versionado. O README e o
guia de onboarding pedem a mesma versão no ambiente local.

## Alternativas consideradas

- **Canal `stable` sem versão:** sempre o Flutter mais novo, mas o build deixa de ser
  reprodutível e quebra sem nenhuma mudança no repositório.
- **`flutter pub get` sem `--enforce-lockfile`:** o CI passaria, mas testaria versões
  diferentes das que estão no lockfile, e o pacote de produção não corresponderia à baseline.

## Consequências

- Mesma entrada, mesmo resultado: o pacote do CD é gerado com as mesmas ferramentas que o CI testou.
- Atualizar o Flutter vira uma mudança explícita, por PR: trocar a versão nos dois workflows,
  rodar `flutter pub get` localmente com a nova versão e versionar o novo `pubspec.lock`.
- Pendente: o Dependabot não atualiza a versão do Flutter; revisar a cada semestre ou quando
  uma dependência exigir um SDK mais novo.

# 0002 — Limite de vulnerabilidades no CI: bloquear só `critical` (risco aceito)

- Status: aceito
- Data: 24/11/2026
- Revisão: até 24/02/2027, ou antes se surgir alerta `high` em dependência de produção

## Contexto

O job `dependencias` do CI (`actions/dependency-review-action`) compara as dependências do PR
com a `main` e reprova o PR conforme a severidade das vulnerabilidades novas (PGC 5.3). O
limite configurado é `critical`.

O app é um tradutor de tela única, sem backend, login, rede ou dados pessoais. Das
dependências, só `flutter` e `cupertino_icons` vão para o pacote de produção;
`flutter_test` e `flutter_lints` são ferramentas de desenvolvimento. O Dependabot (alertas e
PRs de atualização) está ativo e mostra o que existe abaixo de `critical` em
**Security → Dependabot alerts**.

## Decisão

Manter `fail-on-severity: critical` no `ci.yml`. Alertas `high`, `moderate` e `low` não
bloqueiam o merge: são tratados pelos PRs do Dependabot, com revisão do par, dentro do prazo
de revisão acima.

## Alternativas consideradas

- **Subir para `high`:** mais seguro, mas pode bloquear PRs sem relação com a dependência
  vulnerável quando a correção ainda não existe, sem ganho real para um app sem rede e sem dados.
- **Desligar a análise:** descartado; perde a rastreabilidade das dependências (PGC 13).

## Consequências

- O fluxo de PRs não trava por alertas de baixo impacto em ferramentas de desenvolvimento.
- Risco aceito: uma vulnerabilidade `high` pode chegar à `main` até ser corrigida pelo
  Dependabot. Mitigação: alertas ativos e revisão desta decisão no prazo.
- Se o app passar a usar rede, login ou dados pessoais, esta decisão deve ser revista
  (provavelmente para `high`), por mudança de alto risco no CCM.

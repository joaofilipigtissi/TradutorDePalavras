<!--
O título do PR vira a mensagem do commit na main (squash merge) e é usado
para calcular a versão. Use Conventional Commits, por exemplo:
  feat: adiciona idioma espanhol
  fix: corrige navegação circular na primeira palavra
  docs: atualiza instruções do README
-->

## O que muda

<!-- Descreva a alteração em poucas linhas. -->

## Por que

<!-- Qual problema resolve ou qual funcionalidade entrega. -->

Closes #<!-- número da Issue -->

## Tipo de mudança

- [ ] `feat` — nova funcionalidade
- [ ] `fix` — correção de defeito
- [ ] `docs` — documentação
- [ ] `refactor` / `chore` / `test` — sem mudança de comportamento
- [ ] Mudança que quebra compatibilidade (`!` no título)

## Como testar

<!-- Passos para o revisor conferir a mudança. -->

1.
2.

## Checklist

- [ ] O título segue o padrão Conventional Commits
- [ ] `flutter analyze` sem erros
- [ ] `flutter test` passando
- [ ] Testes adicionados ou atualizados quando necessário
- [ ] README / documentação atualizados quando necessário
- [ ] Nenhuma senha, token ou chave no código

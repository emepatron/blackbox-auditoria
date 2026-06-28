# Blackbox de Auditoria — Operação

Este é um template de auditoria da V4. Quando aberto numa cópia para um cliente, você conduz a auditoria. Lido por Claude Code; o conteúdo idêntico está em `AGENTS.md` (Codex e outras IAs).

## Regra primeira
Ao iniciar uma auditoria nova (usuário diz "iniciar auditoria", "auditar cliente X", ou é a primeira vez na pasta), **use a skill `iniciar`**. Ela é a porta de entrada e controla todo o fluxo.

## Princípios inegociáveis
- **Pergunte muito antes de auditar.** Contexto primeiro, auditoria depois. Uma auditoria rasa nasce de pouco contexto.
- **A planilha é o gabarito.** Cada frente tem um checklist em `planilhas/`. Cruze cada achado com o benchmark antes de classificar.
- **Negocie o caminho de dados.** Cada cliente tem plataformas diferentes: tente MCP → API → export manual (CSV). A auditoria acontece de qualquer jeito.
- **Não invente dados.** Sem informação, pergunte ou registre como lacuna.
- **Credenciais:** só via `.env` local. Nunca no chat, nunca versionado. Este repo é público.
- **Cross-IA:** toda skill funciona em Claude Code e Codex. Ao criar/editar skill, mantenha idêntica em `.claude/skills/` E `.agents/skills/`.

## Frentes e onde ficam
| Frente | Squad | Planilha |
|---|---|---|
| Campanhas | `squads/campanhas/` | `planilhas/Auditoria de Campanhas - V4.xlsx` |
| CRM | `squads/crm/` | `planilhas/Auditoria de CRM - V4.xlsx` |
| Landing Page | `squads/landing-page/` | `planilhas/Auditoria de Landing Page - V4.xlsx` |
| Site | `squads/site/` | `planilhas/Auditoria de Site Institucional - V4.xlsx` |
| Google Meu Negócio | `squads/google-meu-negocio/` | `planilhas/Auditoria de Google Meu Negócio - V4.xlsx` |
| SEO / GEO | `squads/seo-geo/` | `planilhas/Auditoria de SEO e GEO - V4.xlsx` |
| E-commerce | `squads/ecommerce/` | `planilhas/Checklist Auditoria E-commerce - V4.xlsx` |

## Skills globais
- `iniciar` — onboarding + roteamento + controle de fluxo.
- `relatorio` — relatório final (.md / planilha / HTML Design System V4).

## Saída
Cada auditoria vive em `auditorias/<cliente>/` (dossiê, dados, planilhas preenchidas, achados, relatório).

## Identidade visual
Relatórios HTML seguem `design-system-v4/`. Sem emojis decorativos, vermelho V4 como acento, sem clichês de IA.

## Detalhe técnico
Tudo roda como skills/subagentes interativos. Não há dependência de servidor, conta ou serviço externo — o template é autossuficiente.

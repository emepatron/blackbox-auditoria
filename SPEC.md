# Blackbox de Auditoria — Arquitetura

Template standalone de auditoria da V4. O time copia a pasta, dá o nome do cliente e conduz a auditoria com IA (Claude Code, Codex, Antigravity ou Gemini). Autossuficiente: nada depende de servidor, conta ou serviço externo.

## Princípios

1. **Standalone** — tudo vive dentro da pasta. Baixa, extrai, roda.
2. **Cross-IA** — toda skill funciona em Claude Code, Codex, Antigravity e Gemini (markdown + duplo-write em `.claude/skills/` e `.agents/skills/`; este último é o diretório cross-runtime lido por Codex, Gemini e Antigravity). Instruções espelhadas em `CLAUDE.md`, `AGENTS.md` e `GEMINI.md`.
3. **A planilha é o gabarito** — cada frente tem um checklist (Fase 1) que guia e recebe os achados. Funciona com ou sem IA.
4. **O caminho de dados é negociado** — clientes têm plataformas e integrações diferentes. O onboarding descobre, caso a caso, COMO obter os dados (MCP, API ou export manual).
5. **Pergunta antes de auditar** — muito contexto primeiro, auditoria depois.

## Ciclo de vida

```
iniciar (onboarding)
  ├─ 1. Contexto: o quê, por quê, o que descobrir, dados do cliente
  ├─ 2. Caminho de dados por frente (MCP / API / export manual)
  ├─ 3. Coleta de acessos, links e arquivos → cria auditorias/<cliente>/
  └─ 4. Dossiê + roteia para o squad da frente
        │
        ▼
  squad da frente conduz (usa as skills por ponto, preenche a planilha)
        │
        ▼
  fim da frente → "auditar mais? outra frente / mais da atual?"
        ├─ sim → volta ao onboarding da próxima frente
        └─ não ▼
  relatorio → formato? (.md / planilha / HTML Design System V4)
```

## Estrutura da pasta

```
blackbox-auditoria/
  README.md                       Como o time usa (passo a passo)
  CLAUDE.md / AGENTS.md / GEMINI.md  Instruções de operação (idênticos)
  SPEC.md                          Este arquivo
  .claude/skills/                  Skills (Claude Code)
  .agents/skills/                  Skills espelhadas (Codex, Gemini, Antigravity) — duplo-write
  squads/<frente>/            Squad por frente (squad.yaml + agents/)
  planilhas/                  7 checklists-gabarito (Fase 1)
  design-system-v4/           Identidade visual V4 (relatórios HTML)
  auditorias/<cliente>/       Saída: uma auditoria por cliente
```

## Frentes e squads

| Frente | Squad (personas) | Planilha-gabarito |
|---|---|---|
| Campanhas | estrategista + google-ads + meta-ads + tiktok-ads + linkedin-ads + tracking | Auditoria de Campanhas |
| CRM | analista de CRM/funil | Auditoria de CRM |
| Landing Page | analista de conversão | Auditoria de Landing Page |
| Site | analista de site/estrutura | Auditoria de Site Institucional |
| Google Meu Negócio | analista de presença local | Auditoria de Google Meu Negócio |
| SEO / GEO | analista de SEO + GEO | Auditoria de SEO e GEO |
| E-commerce | analista de e-commerce | Checklist Auditoria E-commerce |

## Skills

**Globais (controlam o fluxo):**
- `iniciar` — onboarding: contexto, caminho de dados, roteamento.
- `relatorio` — relatório final aprofundado (.md / planilha / HTML V4).

**Por ponto (dentro de cada frente, não uma por squad):**
mapeadas às seções da planilha — ex. Campanhas: `coletar`, `tracking`, `criativos`, `metricas`, `preencher`.

## Reúso de skills do Brain (adaptadas)

| Frente | Base reaproveitada |
|---|---|
| Campanhas | trafego-gestor, trafego-ads-analyst, trafego-ad-creative-analysis, meta-ads-extractor/analyser |
| Landing Page / Site | trafego-landing-page-analysis |
| CRM | cs-crm-diagnostico |
| Relatório HTML | apresentacao-html + Design System V4 |

## Caminho de dados (por frente) — a lógica de negociação

O onboarding tenta nesta ordem, por frente:
1. **MCP conectado** (ex: Meta/Google) → usa direto.
2. **API/acesso** (Reportei, GA4, GHL/Pulsefy, Search Console) → pede credencial via `.env` local (NUNCA hardcoded, NUNCA versionado) e usa.
3. **Export manual** (fallback universal) → instrui o passo a passo do export (CSV do gerenciador, print, PDF) e recebe o arquivo em `auditorias/<cliente>/dados/`.

O fallback manual garante que a auditoria SEMPRE acontece, mesmo sem integração.

## Segurança (repo público)

- Nenhuma credencial, token ou dado de cliente no template.
- `.env`, `auditorias/<cliente>/` (exceto exemplo) e exports ficam no `.gitignore`.
- Cada cópia de cliente guarda dados localmente; nada sobe pro repo público do template.

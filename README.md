# Blackbox de Auditoria — V4

Kit de auditoria da V4. Você copia esta pasta, dá o nome do cliente e a IA (Claude Code ou Codex) conduz a auditoria do começo ao fim, te guiando por perguntas e preenchendo os checklists.

Funciona para 7 frentes: **Campanhas (tráfego pago), CRM, Landing Page, Site, Google Meu Negócio, SEO/GEO e E-commerce.**

> Dá pra usar **só as planilhas**, sem IA. Mas com a IA junto, vira padrão ouro.

---

## Como usar (passo a passo)

### 1. Baixe e extraia
- Pelo GitHub: botão verde **Code → Download ZIP** (ou `git clone` se você usa Git).
- Extraia a pasta `blackbox-auditoria`.

### 2. Renomeie para o cliente
Renomeie a pasta para algo como `auditoria-nome-do-cliente`. Cada cliente = uma cópia.

### 3. Abra com a IA
Abra a pasta no **Claude Code**, **Codex**, **Antigravity** ou **Gemini** (o que você usar).

### 4. Comece
Digite:

```
iniciar auditoria
```

A IA vai assumir daí: pergunta o que você quer auditar, por quê, o contexto do cliente, e **como pegar os dados** (se tem integração pronta ou se você vai exportar um CSV e entregar). Depois conduz a auditoria frente por frente.

### 5. No fim
Quando terminar, a IA pergunta se quer auditar mais alguma coisa. Quando você fechar, ela gera o **relatório final** no formato que você escolher: `.md`, planilha, ou **HTML no visual da V4** (pra mandar pro cliente).

---

## O que tem dentro

| Pasta | O que é |
|---|---|
| `planilhas/` | Os 7 checklists-gabarito (pode usar sozinho, sem IA). |
| `auditorias/` | Onde a auditoria de cada cliente é gerada. |
| `squads/` | Os times de especialistas (IA) de cada frente. |
| `design-system-v4/` | Identidade visual V4 (pros relatórios em HTML). |
| `.claude/skills/` e `.agents/skills/` | As "habilidades" da IA (Claude e Codex). |

## Onde fica o trabalho do cliente
Tudo que a IA produzir fica em `auditorias/<nome-do-cliente>/`:
- `00-dossie.md` — o contexto que você passou.
- `dados/` — os exports/prints que você entregou.
- `planilhas/` — os checklists preenchidos.
- `achados/` — os achados por frente.
- `relatorio/` — o relatório final.

## Dúvidas comuns

**Não tenho integração com Meta/Google. Consigo auditar?**
Sim. A IA te ensina a exportar o CSV do gerenciador e você entrega — a auditoria acontece do mesmo jeito.

**Funciona em qual IA?**
Claude Code, Codex, Antigravity e Gemini — as habilidades estão escritas para todas. Em qualquer uma, o ponto de partida é sempre a habilidade `iniciar`. Como disparar:

| IA | Como começar |
|---|---|
| **Claude Code** | digite `/iniciar` (ou só "iniciar auditoria") |
| **Codex** | escreva "iniciar auditoria do cliente X" — ele carrega sozinho |
| **Antigravity** | abra a pasta e escreva "iniciar auditoria" — ele carrega a habilidade sozinho |
| **Gemini** | escreva "iniciar auditoria" — ele ativa a habilidade |

> Obs.: **Antigravity é o agente do Google, baseado no Gemini** — na prática, mesma família. Funciona igual nos dois: você descreve a tarefa e a IA assume. Só o Claude Code tem o atalho de barra (`/iniciar`).

**Posso usar só a planilha, na mão?**
Pode. Cada planilha em `planilhas/` é autossuficiente, com "como auditar", benchmark e "como corrigir" em cada item.

---

## Segurança

- **Nunca** cole senha, token ou API key no chat. Se precisar de credencial, a IA te orienta a colocar num arquivo `.env` local (que não vai pro Git).
- Os dados do cliente ficam só na sua cópia local. Nada sobe pro repositório do template.

---
Feito pela V4. Identidade visual: Design System V4.

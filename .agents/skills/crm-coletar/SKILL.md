---
name: crm-coletar
description: Use quando o squad de CRM precisar dos dados do CRM do cliente (oportunidades, funil, contatos) e ainda não os tiver. Negocia o caminho — MCP, API ou export manual (CSV/XLSX) — e salva o que receber em auditorias/<cliente>/dados/.
---

# CRM — Coletar dados

Garante que os dados do CRM existem antes de auditar. Sem o funil exportado, não há auditoria — só impressão.

## Caminho de dados (tente nesta ordem)
1. **MCP conectado?** Pergunte se há um MCP do CRM (GHL/Pulsefy, HubSpot, Kommo) na sessão. Se sim, puxe oportunidades, etapas e contatos do período. Lembre: GHL/Pulsefy é SÓ LEITURA — nunca delete ou edite em lote.
2. **API/acesso?** GHL/Pulsefy (PIT), HubSpot, Kommo, Pipedrive, RD CRM. Se houver, peça a credencial via `.env` LOCAL (nunca no chat, nunca versionado) e puxe.
3. **Export manual (fallback universal):** instrua o passo a passo e receba o arquivo:
   - Entre no CRM → módulo de oportunidades/negócios → exporte CSV ou XLSX do período.
   - Peça as colunas: nome do contato, origem/fonte do lead, etapa atual, responsável/dono, valor, data de criação, data da última atividade, data de fechamento (ganho/perdido), motivo de perda.
   - Se possível, peça também: relatório de conversão por etapa e contagem de cards por etapa.

## Boas práticas
- Defina e registre o **período** analisado (ex.: últimos 90 dias) — comparar bases diferentes engana.
- Salve cada arquivo em `auditorias/<cliente>/dados/` com nome claro (ex.: `crm-oportunidades-90d.csv`).
- Anote qual ferramenta de CRM o cliente usa e o ciclo de venda típico — entram no dossiê e guiam os benchmarks.
- O que faltou (ex.: tempo de 1ª resposta, motivos de perda) vira lacuna a perguntar ao time — não invente.

## Saída
Dados em `dados/` + nota curta no dossiê: qual CRM, o que foi obtido, por qual caminho, período e lacunas restantes.

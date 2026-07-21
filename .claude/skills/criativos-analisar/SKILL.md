---
name: criativos-analisar
description: Analisa cada criativo coletado peça a peça — hook, promessa, prova, objeção, CTA, formato por posicionamento, legenda e alinhamento anúncio-destino — e fecha com três vereditos (copy, visual e peça) em Manter/Ajustar/Matar. Use depois da criativos-coletar, ou quando alguém pedir "analisa os anúncios", "o que tem de errado nos criativos", "por que os anúncios não convertem".
---

# Criativos — Analisar peça a peça

Aqui a auditoria deixa de olhar a conta e passa a olhar o anúncio. Uma peça por vez, com a régua da aba **Critérios** da planilha `Auditoria de Criativos - V4.xlsx`.

Leia a aba Critérios antes de julgar qualquer coisa. Ela é o gabarito — sem ela o preenchimento vira opinião, e opinião não sustenta uma auditoria na frente do cliente.

## Antes de começar

1. `auditorias/<cliente>/criativos/inventario.csv` existe e está ordenado por gasto? Se não, volte para a `criativos-coletar`.
1.1. **Só peça ativa entra.** Confirme campanha ativa E anúncio ativo. Peça pausada não recebe veredito — se aparecer no inventário, remova antes de começar.
2. Confirme o recorte: as peças que somam ~80% da verba, teto de 20. Anote quantas ficaram de fora.
3. Confirme o que você tem de cada peça: arquivo, texto do anúncio, destino do clique, métricas. O que faltar vira lacuna declarada, nunca estimativa.

## Como ler um vídeo

Extraia os frames dos momentos que decidem, e transcreva o áudio:

```bash
V="auditorias/<cliente>/criativos/meta/001-oferta.mp4"
D=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$V")
for t in 0 1 3 $(echo "$D/2" | bc) $(echo "$D-1" | bc); do
  ffmpeg -v error -ss "$t" -i "$V" -frames:v 1 "${V%.mp4}-frame-${t}s.jpg" -y
done
ffmpeg -v error -i "$V" -vn -ar 16000 -ac 1 "${V%.mp4}.wav" -y
```

Olhe os frames de 0s, 1s e 3s **antes** de qualquer outro: é ali que o hook vive ou morre. Transcreva o áudio do `.wav` e junte com o texto do anúncio para julgar a copy.

Sem `ffmpeg` disponível, use o pôster do vídeo e os screenshots coletados, e declare que a análise temporal ficou limitada.

## Como julgar cada peça

Primeiro assista como espectador, uma vez, sem pausar. Anote a primeira reação — se você não entendeu a oferta na primeira passada, o público também não. Só depois volte com a régua.

Percorra os oito critérios da planilha e classifique cada um em **OK / Ajustar / Crítico / N/A**:

| Critério | A pergunta que ele responde |
|---|---|
| Hook (0-3s) | Prende antes da rolagem? |
| Promessa / oferta | Dá para dizer o que é oferecido, para quem e por que funciona? |
| Prova | O que sustenta a promessa? |
| Objeção tratada | A peça antecipa a principal resistência? |
| CTA | Há uma ação única, explícita e coerente com a etapa? |
| Formato x posicionamento | A peça é nativa de onde roda? |
| Alinhamento → destino | A promessa aparece na primeira dobra da página, com as mesmas palavras? |
| Legenda / som off | Se sustenta com o som desligado? |

Quando a copy da peça exigir leitura mais funda — nível de consciência, mecanismo, coerência com a etapa do funil —, chame a skill `copy-auditar`. Ela é a mesma régua usada nas frentes de LP, site, e-commerce e GMN, o que mantém o julgamento de copy consistente na auditoria inteira.

Depois cruze com o número, quando houver: gasto, % da verba, CTR e CPL/CPA contra a média da conta.

## Os três vereditos

- **VEREDITO COPY** — o que a peça diz.
- **VEREDITO VISUAL** — como ela se apresenta.
- **VEREDITO DA PEÇA** — o consolidado, que é o que vira decisão.

Cada um em **Manter / Ajustar / Matar**. Separar copy de visual é o que produz o achado útil: *"o vídeo prende bem, a copy entrega uma promessa que a página não cumpre — troca só o texto"*. Veredito único esconde isso e faz o cliente jogar fora peça boa.

Régua do consolidado:
- **Manter** — cumpre o papel. Pode escalar ou virar base de variação.
- **Ajustar** — o conceito serve, a execução não. Diga o que trocar, especificamente.
- **Matar** — não vale reescrever. Sai do ar, a verba vai para outra peça.

Peça com gasto relevante, CPA acima da média da conta e critério crítico em vermelho é **Matar** — mesmo que seja a peça preferida do cliente. É esse achado que paga a auditoria.

## Regras que não se dobram

- Todo veredito tem um porquê concreto, ancorado no que foi visto ou medido. "Criativo fraco" não é achado.
- Amostra pequena não vira taxa: peça com poucas impressões não tem CTR confiável — registre "sem leitura" em vez de julgar pelo número.
- **CTR bom com conversão ruim quase nunca é criativo ruim** — é quebra entre anúncio e página de destino. Olhe a LP antes de condenar a peça.
- Peça vinda só da Biblioteca de Anúncios não tem métrica. Julgue o qualitativo, deixe as colunas de número vazias e diga isso no relatório. Não estime gasto.
- Nunca julgue a peça pelo monitor: ela vai ser vista no celular, rolando, sem som.

## Saída

Para cada peça auditada, um bloco com: identificação, formato, números (se houver), os oito critérios classificados, os três vereditos, o porquê e a ação de correção — pronto para a `criativos-preencher` transformar em linha de planilha.

Escreva também os **3 a 5 achados transversais** — os padrões que se repetem entre as peças (ex.: nenhuma peça tem legenda; todo o orçamento está em uma única oferta; nenhum criativo trata objeção de preço). É isso que vira recomendação estrutural no relatório, não a soma dos achados individuais.

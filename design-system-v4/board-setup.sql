-- ============================================================
-- Board de acompanhamento das auditorias (A fazer / Fazendo / Feito)
-- Rodar UMA vez no SQL Editor de um projeto Supabase DEDICADO
-- (não misturar com projeto que tenha dados de cliente — a anon key
--  vai num HTML público, então o projeto deve conter só esta tabela).
-- ============================================================

create table if not exists public.auditoria_board (
  doc        text not null,        -- ex.: 'cliente-a', 'cliente-b'
  item_id    text not null,        -- hash estável do item (gerado pelo front)
  status     text not null default 'a_fazer'
             check (status in ('a_fazer','fazendo','feito')),
  updated_at timestamptz not null default now(),
  primary key (doc, item_id)
);

alter table public.auditoria_board enable row level security;

-- Time interno marca anonimamente: leitura e escrita públicas SÓ nesta tabela.
-- (projeto dedicado sem dados sensíveis; pior caso = alguém mexer num status, reversível)
create policy "board leitura publica" on public.auditoria_board
  for select using (true);
create policy "board insert publico" on public.auditoria_board
  for insert with check (true);
create policy "board update publico" on public.auditoria_board
  for update using (true) with check (true);

-- Tempo real: todos veem a mudança na hora
alter publication supabase_realtime add table public.auditoria_board;

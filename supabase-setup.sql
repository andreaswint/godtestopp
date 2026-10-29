-- Godtestopp: databaseoppsett for Supabase
-- Kjør hele denne fila i Supabase-dashbordet: SQL Editor → New query → lim inn → Run

-- Tabell: én rad per bruker per dag
create table public.days (
  user_id uuid not null references auth.users (id) on delete cascade,
  day     date not null,
  status  text not null check (status in ('free', 'slip')),
  ts      timestamptz not null default now(),
  primary key (user_id, day)
);

-- Row Level Security: hver bruker ser og endrer KUN sine egne rader.
-- Dette er det som gjør at anon-nøkkelen trygt kan ligge i HTML-fila.
alter table public.days enable row level security;

create policy "Brukere leser egne dager"
  on public.days for select
  using (auth.uid() = user_id);

create policy "Brukere oppretter egne dager"
  on public.days for insert
  with check (auth.uid() = user_id);

create policy "Brukere endrer egne dager"
  on public.days for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "Brukere sletter egne dager"
  on public.days for delete
  using (auth.uid() = user_id);

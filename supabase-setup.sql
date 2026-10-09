-- Run this once in your Supabase project: SQL Editor -> New query -> paste -> Run.
create table if not exists public.portfolios (
  user_id uuid not null references auth.users(id) on delete cascade,
  app text not null,
  data jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, app)
);

alter table public.portfolios enable row level security;

-- Each signed-in user can only see and change their own rows.
create policy "read own portfolio" on public.portfolios
  for select using (auth.uid() = user_id);
create policy "insert own portfolio" on public.portfolios
  for insert with check (auth.uid() = user_id);
create policy "update own portfolio" on public.portfolios
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

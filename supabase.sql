-- Ikiloop public site: votes, tester sign-ups, wishes.
-- Run once in Supabase (same project as StratAG): SQL Editor -> paste -> Run.
create table if not exists ik_votes (voter text primary key, app text not null check (char_length(app) < 40), at timestamptz default now());
create table if not exists ik_testers (id bigint generated always as identity primary key, visitor text, contact text not null check (char_length(contact) <= 120), app text, at timestamptz default now());
create table if not exists ik_wishes (id bigint generated always as identity primary key, visitor text, app text, text text not null check (char_length(text) <= 280), at timestamptz default now());
alter table ik_votes enable row level security;
alter table ik_testers enable row level security;
alter table ik_wishes enable row level security;
-- Anyone can read vote counts and cast/change a vote (no personal data in this table).
create policy "votes read" on ik_votes for select to anon using (true);
create policy "votes add" on ik_votes for insert to anon with check (true);
create policy "votes change" on ik_votes for update to anon using (true) with check (true);
-- Testers and wishes: anyone can send, nobody but you (dashboard) can read.
create policy "testers add" on ik_testers for insert to anon with check (true);
create policy "wishes add" on ik_wishes for insert to anon with check (true);

# ikiloop

The Ikiloop studio site. One static page, no build step.

- `index.html` — the whole site
- `og.png` — link preview image
- `supabase.sql` — run once in Supabase to turn on votes, tester sign-ups and wishes

Deploy: import this repo in Vercel (Framework preset: Other). Turn on Web Analytics in the Vercel project for free visitor stats.
Read sign-ups and wishes in Supabase → Table Editor → `ik_testers`, `ik_wishes`.

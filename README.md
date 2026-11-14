# Godtestopp

Gamifisert tracker for godtefrie dager — streaks, XP, nivåer, merker og
skamfri registrering av sprekker. Norsk, mobilvennlig, én HTML-fil.

**Live:** https://godtestopp.andreaswinther.no
(GitHub Pages fra dette repoet, `index.html` på `main`; CNAME-post hos one.com)

## Slik fungerer den

- Trykk «I dag var godtefri» for å registrere dagen (+10 XP, konfetti)
- «Jeg sprakk i dag» logges uten skam — og gir +2 XP for ærlighet
- Kalenderen lar deg registrere eller rette dager bakover i tid
- Streak-ring mot neste milepæl, nivåer fra «Nysgjerrig» til «Legende»,
  og ni merker å låse opp

## Lagring

Loggen lagres **lokalt i nettleseren** (localStorage) på hver enhet —
helt privat, ingen konto eller innlogging. Det betyr også at loggen ikke
synkroniseres mellom enheter, og at den forsvinner hvis nettleserdata
slettes. Hver person bruker appen på sin egen enhet.

> Tidligere brukte appen Supabase med e-postinnlogging og synkronisering;
> det ble fjernet 14. nov 2026 for å slippe en ekstern tjeneste.

## Endre appen

Rediger `index.html` og push til `main` — GitHub Pages redeployer
automatisk i løpet av et minutt eller to. (`godtestopp.html` er en kopi
av samme fil; `supabase-setup.sql` er kun historikk.)

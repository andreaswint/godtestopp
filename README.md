# Godtestopp — selvhostet med Supabase-synk

Én HTML-fil du legger på din egen nettside. Hver bruker logger inn med e-post
(innloggingslenke, ingen passord) og får sin egen private logg som synkroniseres
mellom alle enheter.

## Status

Dette er allerede gjort (oktober 2026):

- ✅ Supabase-prosjektet `godtestopp` er opprettet i organisasjonen TIBE
  (EU-region) — prosjekt-URL `https://uhjphrkerasveybgonyv.supabase.co`
- ✅ Databasetabellen og Row Level Security er satt opp (`supabase-setup.sql`
  er kjørt)
- ✅ Prosjekt-URL og publishable-nøkkel er limt inn i `godtestopp.html`

Og hosting:

- ✅ Appen er live på **https://godtestopp.andreaswinther.no** via GitHub
  Pages (dette repoet, `index.html` på `main`)
- ✅ CNAME-post hos one.com: `godtestopp` → `andreaswint.github.io`
- ✅ Site URL i Supabase: `https://godtestopp.andreaswinther.no`

## Gjenstår

- Når GitHub har utstedt HTTPS-sertifikatet (15–60 min etter oppsett),
  huk av **Enforce HTTPS** under repoets Settings → Pages
- Supabase sender maks ca. 2 innloggingse-poster i timen med innebygd
  utsending — be familien logge inn litt spredt, eller koble til egen SMTP
  under Authentication → Emails

> Nøkkelen i HTML-fila er en «publishable key» — laget for å være offentlig.
> Row Level Security i databasen sørger for at hver bruker kun får tilgang
> til sine egne rader.

## Slik fungerer det

- **Innlogging:** brukeren skriver inn e-post og får en innloggingslenke.
  Nye brukere opprettes automatisk første gang.
- **Uten innlogging:** appen fungerer fortsatt, men lagrer kun lokalt i
  nettleseren («fortsett uten konto»).
- **Automatisk import:** har noen brukt appen lokalt før de logget inn,
  flyttes registreringene til kontoen deres ved første innlogging.
- **Personvern:** ingen ser andres registreringer — hverken sprekker eller
  streaks. Håndhevet av databasen, ikke bare av appen.

## Verdt å vite

- Supabase sin innebygde e-postutsending er begrenset (noen få e-poster i
  timen) — mer enn nok for familie og venner. For mange brukere: koble til
  egen SMTP under **Authentication → Emails**.
- Gratisnivået i Supabase pauser prosjekter etter en ukes inaktivitet uten
  trafikk; de våkner igjen ved bruk, men kan da svare tregt første gang.
  Appen faller i så fall tilbake til lokal lagring til skyen svarer.

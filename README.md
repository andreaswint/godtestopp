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

## Gjenstår (2 steg)

### 1. Sett innloggingsadressen
Når du vet hvor appen skal ligge (f.eks. `https://dinside.no/godtestopp.html`):
1. Gå til [Authentication → URL Configuration](https://supabase.com/dashboard/project/uhjphrkerasveybgonyv/auth/url-configuration)
2. Sett **Site URL** til den adressen, og legg den også til under
   **Redirect URLs**

Uten dette peker innloggingslenkene i e-postene til feil adresse
(standard er `http://localhost:3000`).

### 2. Last opp
Last opp `godtestopp.html` til webhotellet ditt (eller Netlify/Vercel/GitHub
Pages). Ferdig!

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

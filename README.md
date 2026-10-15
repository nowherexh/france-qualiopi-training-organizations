# France Training Organizations & Qualiopi Database

**Every training organisation in France with its Qualiopi status — and an alert the day one gains or loses Qualiopi.** Build prospect lists by area and specialty, or check a partner's certification.

> 🇫🇷 Liste publique des organismes de formation avec certification Qualiopi, et alertes sur les gains et pertes. Les exemples ci-dessous sont en anglais ; les données restent en français.

**[▶ Run it on Apify](https://apify.com/jet_mythology/france-training-organizations)** — no installation, no scraping, official data only.

## Use it without code

1. Open the [Actor page](https://apify.com/jet_mythology/france-training-organizations) and click **Try for free**.
2. Paste one of the inputs below (or use the form).
3. Click **Start**, then **Export** the results as **Excel, CSV or JSON**, or send them to Google Sheets, Make, Zapier or n8n.

Schedule it (daily or weekly) to get only what changed since the last run.

## Sample output

```json
{
  "nda": "75331187133",
  "name": "GRADES ESEA NOUVELLE-AQUITAINE",
  "siret": "13002347600018",
  "address": {
    "postalCode": "33000",
    "city": "BORDEAUX",
    "department": "33"
  },
  "qualiopi": {
    "training": true,
    "skillsAssessment": false,
    "vae": false,
    "apprenticeship": false,
    "certified": true
  },
  "specialties": [
    {
      "code": "331",
      "label": "Santé"
    }
  ],
  "trainees": 44751,
  "trainers": 31
}
```

*Real result from 12 October 2026 (abridged).* Full field list below.

## Use it from code

Get your API token in [Apify Console → Settings → API & Integrations](https://console.apify.com/settings/integrations).

**Python** (`pip install apify-client`) — see [`examples/run.py`](examples/run.py)

```python
from apify_client import ApifyClient

client = ApifyClient("YOUR_APIFY_TOKEN")
run = client.actor("jet_mythology/france-training-organizations").call(run_input={"qualiopiOnly": true, "departments": ["33"], "minTrainees": 50})
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item)
```

**JavaScript** (`npm install apify-client`) — see [`examples/run.mjs`](examples/run.mjs)

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: "YOUR_APIFY_TOKEN" });
const run = await client.actor("jet_mythology/france-training-organizations").call({"qualiopiOnly": true, "departments": ["33"], "minTrainees": 50});
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

**curl** — one call, results returned directly — see [`examples/run.sh`](examples/run.sh)

```bash
curl -X POST "https://api.apify.com/v2/acts/jet_mythology~france-training-organizations/run-sync-get-dataset-items?token=$APIFY_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"qualiopiOnly": true, "departments": ["33"], "minTrainees": 50}'
```

## Example inputs

**Qualiopi-certified providers in Gironde with at least 50 trainees a year**
```json
{"qualiopiOnly": true, "departments": ["33"], "minTrainees": 50}
```

**Language schools in Île-de-France**
```json
{"regionCodes": ["11"], "specialtyKeywords": ["langues"]}
```

**Prospects for a Qualiopi consultant**
```json
{"notCertifiedOnly": true, "minTrainees": 20, "departments": ["75", "92", "93", "94"]}
```

**Weekly alert on Qualiopi losses in your region**
```json
{"regionCodes": ["75"], "monitorChanges": true, "monitorKey": "na-weekly", "monitorFirstRun": "baselineOnly"}
```

## Who uses it

- **Software vendors** (LMS, training management, e-signature, CPF tools): build targeted lists of training providers by size, region and specialty.
- **Qualiopi consultants and auditors**: find organisations that are not certified, or that just lost their certification.
- **Funders, OPCOs, HR and procurement**: verify a provider's declaration and Qualiopi status before buying.
- **Researchers and journalists**: map the French training market.

## What you get

| Field | Description |
|---|---|
| `nda`, `previousNdas` | Official declaration number(s) |
| `name`, `siren`, `siret` | Legal identity |
| `address` | Street, postal code, city, département, region code |
| `qualiopi` | `certified`, plus `training`, `skillsAssessment` (bilan de compétences), `vae`, `apprenticeship` |
| `specialties` | Declared training specialties (NSF code and label) |
| `trainees`, `traineesSubcontracted`, `trainers` | From the last annual declaration |
| `lastDeclarationDate`, `fiscalYearStart`, `fiscalYearEnd` | Declaration dates |
| `otherFields` | Every other source column, unchanged |
| `changeType` | Monitor mode: `new`, `removed`, `qualiopi-gained`, `qualiopi-lost`, `qualiopi-changed` |

Results are sorted biggest first (by number of trainees). A summary is saved under `OUTPUT`.

## Pricing

Pay per result on Apify: you only pay for the items returned, nothing for what is filtered out. In monitor mode you only pay for new or changed items. Current prices are on the [Actor page](https://apify.com/jet_mythology/france-training-organizations).

## Good to know

- The list contains organisations whose declaration is active and whose annual report (bilan pédagogique et financier) is up to date. Organisations leave it when they cease activity, when their declaration is cancelled or when it lapses.
- Trainee and trainer counts are self-declared in the annual report.
- Contact details (e-mail, phone) are not part of the official list.
- If you use the data for B2B prospecting, follow the GDPR rules that apply to your outreach.

## Source and licence

Liste publique des organismes de formation (article L.6351-7-1 du Code du travail), Ministère du Travail, published on data.gouv.fr under Licence Ouverte. This Actor is independent and not affiliated with the French administration.

The code examples in this repository are under the MIT licence. This repository contains usage examples only; the Actor itself runs on [Apify](https://apify.com/jet_mythology/france-training-organizations).

---

More French public data Actors by the same author: [apify.com/jet_mythology](https://apify.com/jet_mythology)

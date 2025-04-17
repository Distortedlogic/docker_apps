set shell := ["bash", "-uc"]
set export
set dotenv-load

mod bundle "bundle.just"

default:
  @just --choose --justfile {{justfile()}}

web:
  #!/usr/bin/env bash
  set -euo pipefail
  dx serve --platform web --port 8095 -p app

desktop:
  #!/usr/bin/env bash
  set -euo pipefail
  dx serve --platform desktop -p app

mobile:
  #!/usr/bin/env bash
  set -euo pipefail
  dx serve --platform mobile -p app

tailwind:
  #!/usr/bin/env bash
  set -euo pipefail
  cd ./app/
  npx tailwindcss -i ./input.css -o ./assets/tailwind.css --watch

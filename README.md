# sapling

*Plant it, grow an app.*

A Rails 8.1 + React starter for small, self-hosted apps. One repo, one deploy:
Rails serves a React SPA and the flat JSON API it talks to.

It's the baseline I start every project from, and the counterpart to
[evergreen](https://github.com/aaronmiler/evergreen): sapling starts an app, evergreen
keeps it healthy. It's opinionated on purpose: everything here is something every app
ends up needing, and nothing else.

## Why these choices

- **One Postgres, no Redis.** Jobs run on [good_job](https://github.com/bensheldon/good_job),
  backed by the same database. One fewer service to run in dev and prod.
- **Vite owns the frontend.** No Propshaft or Sprockets. `vite_rails` builds `frontend/`
  and hooks into `assets:precompile`, so the Docker image ships prebuilt assets.
- **Typed API calls without hand-written clients.** [js_from_routes](https://js-from-routes.netlify.app/)
  generates TypeScript path helpers from `config/routes.rb`, and react-query handles fetching and caching.
- **A flat, unversioned `/api`.** It has one consumer, the bundled frontend, so versioning is overhead.
  Responses are serialized with [Blueprinter](https://github.com/procore-oss/blueprinter).
- **Env vars over encrypted credentials.** Config comes from `.env` in dev and the
  environment in prod. Reach for encrypted credentials only when something needs encrypting.
- **Shared house style.** RuboCop and Prettier rules and a weekly gem-audit workflow come from
  [evergreen](https://github.com/aaronmiler/evergreen), so every app stays in step.

## Stack

| | |
|---|---|
| Backend | Ruby 3.4, Rails 8.1, Postgres, good_job, httpx, Blueprinter |
| Frontend | React 19, TypeScript, react-router 7, TanStack Query, Tailwind 4, Vite |
| Tests | RSpec, FactoryBot, shoulda-matchers, WebMock |
| Quality | RuboCop (omakase + evergreen), Prettier, Brakeman, bundler-audit |
| Deploy | Docker + Thruster |

## Getting started

Copy the starter and rename it:

```sh
cp -r sapling my_app && cd my_app
bin/rename_app my_app
```

`bin/rename_app` rewrites the module, database, and package names, then deletes itself.

Start Postgres (any local instance on `localhost:5432` works):

```sh
docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres:16
```

Then set up and run:

```sh
bin/setup   # installs gems + yarn packages, syncs style config, prepares the DB, starts the server
bin/dev     # later runs: Rails + Vite dev server
```

Visit `http://localhost:3000`. The page calls `GET /api/pings`, which proves the whole
chain (route → controller → Blueprint → generated TS helper → react-query) works.
Delete the ping demo once you have real resources.

Other endpoints: `GET /up` (health check) and `/good_job` (job dashboard, development only).

## Checks

```sh
bin/ci
```

Runs RuboCop, Prettier, TypeScript, Brakeman, bundler-audit, and RSpec. GitHub Actions
runs the same checks on every push and PR.

## Conventions

- **Services:** POROs in `app/services/` inherit from `ApplicationService`. Arguments go
  to `.call`, never to `#initialize`.
- **API:** controllers in `app/controllers/api/`, serializers in `app/blueprints/`. Mark a
  route `defaults: { export: true }` to generate its TypeScript helper.
- **SPA routing:** there's no catch-all route by default. Add one when your app has
  client-side routes (there's an example in `config/routes.rb`).
- **Optional frameworks:** Active Storage, Action Mailbox, Action Text, and Action Cable
  are commented out in `config/application.rb`. Enable them when an app needs them.

## Deployment

Build the Dockerfile and run it with these env vars:

| Variable | |
|---|---|
| `SECRET_KEY_BASE` | Generate with `bin/rails secret` |
| `DATABASE_URL` | `postgres://user:password@host:5432/app_production` |

The entrypoint runs `db:prepare` on boot, so migrations apply automatically.

## Using your own style config

`.rubocop.yml` and `bin/sync-style` point at [evergreen](https://github.com/aaronmiler/evergreen).
To use your own rules, point those two URLs at your fork, or replace them with local config files.

## License

[MIT](LICENSE)

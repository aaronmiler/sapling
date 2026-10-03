source "https://rubygems.org"

gem "rails", "~> 8.1.3"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Frontend build tooling — Vite drives the React/TypeScript app in frontend/.
# There is no propshaft/sprockets here: Vite owns every asset, and vite_rails
# hooks `vite:build` into `assets:precompile` for the production image.
gem "vite_rails"

# JSON serialization for the /api layer
gem "blueprinter"

# Background jobs, Postgres-backed — no extra service to run in dev or prod.
gem "good_job"

# HTTP client for outbound calls (timeouts, retries, connection reuse)
gem "httpx"

# json 3.0 made JSON.parse options keyword-only; Rails 8.1.3.1's ActiveSupport::JSON.decode
# still passes a positional hash, which breaks every JSON column read. Drop once Rails catches up.
gem "json", "< 3"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # RSpec test framework + factories (replaces Minitest)
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "shoulda-matchers"

  # Stub outbound HTTP in specs — nothing should hit the network
  gem "webmock"

  # Load environment variables from .env files
  gem "dotenv-rails"

  # Generate typed API/path helpers for the frontend from Rails routes
  gem "js_from_routes"

  # Runs Rails + Vite together for bin/dev (Procfile.dev)
  gem "foreman", require: false

  # Audits gems for known security defects (use config/bundler-audit.yml to ignore issues)
  gem "bundler-audit", require: false

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

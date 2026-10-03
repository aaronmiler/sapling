# sapling

This is a **baseline template**, not an app. New apps are copied from it
(`bin/rename_app <name>`) and then extended. See `README.md` for the stack and commands.

Style config (RuboCop, Prettier) and the gem-audit workflow come from
[evergreen](https://github.com/aaronmiler/evergreen). Change shared rules there, not here.

## Working in the starter itself
- Keep it minimal: only add what every app needs. App-specific conventions belong in the app.
- The ping demo (`/api/pings`, `PingBlueprint`, `App.tsx` query) exists to prove the
  Rails → Blueprint → js_from_routes → react-query chain. Keep it working.

## Working in an app derived from it
- Delete the ping demo once real API resources exist.
- Add an SPA catch-all route in `config/routes.rb` when client-side routes arrive (example comment there).
- Replace this file with the app's own CLAUDE.md.

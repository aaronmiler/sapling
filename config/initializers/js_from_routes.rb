# Frontend lives in frontend/, not app/frontend, so the gem's default
# app/<dir>/api output folder doesn't apply here.
#
# The gem still computes that default before reading this config, and crashes
# unless one of app/{frontend,packs,javascript,assets} exists — which is the only
# reason app/assets/.keep is in the repo. Don't delete it.
JsFromRoutes.config do |config|
  config.output_folder = Rails.root.join("frontend/lib/routes")
  config.file_suffix = "Api.ts"
end

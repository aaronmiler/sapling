Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # `export: true` marks a route for js_from_routes to generate a typed path
  # helper for in frontend/lib/routes/ — add it to real API routes as you build them.
  namespace :api do
    resources :pings, only: [:index], defaults: { export: true }
  end

  # No SPA catch-all here — each app adds its own once it has client-side routes, e.g.
  #   get "*path", to: "home#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  if Rails.env.development?
    mount GoodJob::Engine => "/good_job"
  end
end

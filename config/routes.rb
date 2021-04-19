Rails.application.routes.draw do
  root 'home#index'
  get 'service-worker.js', to: 'home#service_worker'
end

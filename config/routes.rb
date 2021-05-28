Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  devise_scope :users do
    root 'dashboards#index'
    resources :dashboards, only: %i[update edit]
    resource :dashboard, only: %i[index]
    get 'dashboards/:id/coins', to: 'dashboards#coins'
  end
  get 'service-worker.js', to: 'dashboards#service_worker'
end

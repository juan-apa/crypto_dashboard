Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :users do
    root 'dashboards#index'
    resource :dashboard, only: :index
    get 'dashboards/:id/coins', to: 'dashboards#coins'
  end
  get 'service-worker.js', to: 'dashboards#service_worker'
end

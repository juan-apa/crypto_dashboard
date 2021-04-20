Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :users do
    root 'home#index'
  end
  get 'service-worker.js', to: 'home#service_worker'
end

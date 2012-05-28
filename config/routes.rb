TestTask::Application.routes.draw do
  resources :brends

  resources :companies

  resources :campaigns

  root :to => 'companies#index'


end

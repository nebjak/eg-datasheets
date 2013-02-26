Datasheets::Application.routes.draw do
  resources :small_generators
  root :to => 'small_generators#index'
end

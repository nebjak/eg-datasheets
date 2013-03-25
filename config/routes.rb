Datasheets::Application.routes.draw do
  resources :big_generators
  resources :small_generators
  root :to => 'small_generators#index'
end

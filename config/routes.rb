Rails.application.routes.draw do
  resources :trajetos 
  resources :admins 
  resources :campus_uffs do
    get :autocomplete_admins_nome, :on => :collection
  end
  
  get 'welcome/index'
  get 'search', to: 'search#trajetos'
  get 'search/campus', to: 'search#campus'
  get 'search/iduff', to: 'search#iduff'
  get 'admins/ativar/:id', to: 'admins#ativar', as: :ativar_admin
  get 'admins/desativar/:id', to: 'admins#desativar', as: :desativar_admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'trajetos#index'


end

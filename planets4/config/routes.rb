Planets4::Application.routes.draw do
  resources :satellites

  root "satellites#index"


end

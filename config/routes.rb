Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'invoice_numbers#new'
  post 'invoice_numbers/parse_number'
  resources :macro_polo, only: [:index]
end

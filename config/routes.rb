Rails.application.routes.draw do
  resources :urls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/:short_url', to: 'urls#redirect'
end

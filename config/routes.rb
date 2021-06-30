Rails.application.routes.draw do
  get 'rpg/index'
  # post 'rpg/farm'
  # post 'rpg/cave'
  # post 'rpg/casino'
  # post 'rpg/house'
  get 'rpg/reset'
  post 'process_money' => 'rpg#process_form'

  root 'rpg#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

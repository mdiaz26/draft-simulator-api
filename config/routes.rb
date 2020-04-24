Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roster_configs
      resources :ranking_players
      resources :rankings
      resources :franchise_players
      resources :players
      resources :franchises
      resources :drafts

      get 'drafts/:id/franchise_players', to: 'drafts#draft_franchise_players', as: 'draft_franchise_players'

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

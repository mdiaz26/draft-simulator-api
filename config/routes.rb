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
      get 'rankings/:id/ranking_players', to: 'rankings#ranking_ranking_players', as: 'ranking_ranking_players'
      post 'draft_franchises', to: 'franchises#create_draft_franchises', as: 'create_draft_franchises'

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

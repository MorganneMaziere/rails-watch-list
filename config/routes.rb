Rails.application.routes.draw do
  resources :lists, only: %i[index new show create destroy] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: [:create]
  end
  resources :bookmarks, only: [:destroy]
end

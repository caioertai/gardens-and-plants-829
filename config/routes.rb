Rails.application.routes.draw do
  resources :gardens, only: [:show, :index] do
    # /gardens/:garden_id
    resources :plants, only: [:new, :create]
  end

  resources :plants, only: :destroy do
    # /plants/:plant_id/...
    resources :taggings, only: [:new, :create]
  end
end

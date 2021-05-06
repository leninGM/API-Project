Rails.application.routes.draw do
  resources :people do
    get :email_chars_count, on: :collection
  end

  root to: "people#index"
end

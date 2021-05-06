Rails.application.routes.draw do
  resources :people do
    get :email_chars_count, on: :collection
    get :similar_emails, on: :member
  end

  root to: "people#index"
end

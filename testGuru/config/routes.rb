Rails.application.routes.draw do
  
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    post :start, on: :member
  end
  
  resources :results, only &i[show update] do
  	member do
  	  get :statistic
  	end
  end
end

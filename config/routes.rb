Rails.application.routes.draw do
  
  devise_for :admin
  devise_for :customers
   get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :items, except:[:destroy]
  end

end

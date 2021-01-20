Rails.application.routes.draw do
  devise_for :admin
  devise_for :customers
   get '/admin' => 'admin/homes#top'
  
end

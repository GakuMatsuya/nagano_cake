Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions/sessions',
    passwords: 'admin/sessions/passwords',
    registrations: 'admin/sessions/registrations'
  }
  
  
  
  
  
  devise_for :customers
   get '/admin' => 'admin/homes#top'
  
  namespace :admin do
    resources :items, except:[:destroy]
    resources :genres, except:[:show, :destroy]
    resources :customers, except:[:new, :create, :destroy]
  end

end

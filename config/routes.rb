Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: 'admin/sessions/sessions',
    passwords: 'admin/sessions/passwords',
    registrations: 'admin/sessions/registrations'
  }

  devise_for :customers, controllers: {
    sessions: "public/sessions/sessions",
    passwords: "public/sessions/passwords",
    registrations: "public/sessions/registrations"
  }

  get '/admin' => 'admin/homes#top'
  get "/" => "public/homes#top"
  get "/about" => "public/homes#about"
  get "/customers/my_page" => "public/customers#show"
  post "/orders/confirm" => "public/orders#confirm"
  get "/orders/thanks" => "public/orders#thanks"
  delete "/cart_items/destroy_all" => "public/cart_items#destroy_all"


  namespace :admin do
    resources :items, except:[:destroy]
    resources :genres, except:[:show, :destroy]
    resources :customers, except:[:new, :create, :destroy]
    resources :orders, only:[:index, :show, :update]
  end

  scope module: :public do
    resources :orders, only:[:new, :create, :show]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :create]
  end


end

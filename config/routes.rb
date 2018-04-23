Rails.application.routes.draw do

  devise_for :users
   #get 'dashboard/index'

    root 'dashboard#index'
  
    post 'import_from_excel' => "actionfolders#import_from_excel"

    delete 'actionfolders/apagar_todas', :as => :apagar_todas

  
    resources :actionfolders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

    root 'actionfolders#index'
  
    post 'import_from_excel' => "actionfolders#import_from_excel"
  
    resources :actionfolders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

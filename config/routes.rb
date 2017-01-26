Rails.application.routes.draw do

    resources :people do
        resources :reports do
            member do
              get 'get_report' => 'reports#gen_pdf'
            end
            resources :courses do
            end
        end
    end

    resources :colleges do
      resources :departments
    end
#    get 'welcome/index'
    get '/unauthorized' => 'application#unauthorized'
    root 'welcome#index'

    post '/usersearch/' => 'people#usersearch'
    post '/makeadmin' => 'people#makeadmin'
    post '/revokeadmin' => 'people#revokeadmin'

	  get '/authorize' => 'application#authorize'
    delete '/logout' => 'application#logout'
end

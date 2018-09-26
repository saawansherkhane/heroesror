Rails.application.routes.draw do

  resources :heros do
    get 'search', :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Grape API
  mount Bank::API => '/'

  mount GrapeSwaggerRails::Engine => '/swagger'

end

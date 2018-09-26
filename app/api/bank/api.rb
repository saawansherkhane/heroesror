require 'grape-swagger'

module Bank
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    mount Bank::BranchAPI
    mount Bank::CustomerAPI
    mount Bank::AccountAPI
    mount Bank::ArticleAPI

    get :routes do
      desc 'List all available routes with description based on version'
      Grape::API.decorated_routes.map do |route|
        {
            route_path: route.route_path,
            route_method: route.route_method,
            helper_names: route.helper_names,
            helper_arguments: route.helper_arguments,
            description: route.route.options[:description],
        }
      end
    end

    add_swagger_documentation mount_path: '/swagger_doc'

  end
end
module Bank
  class BranchAPI < Grape::API

    resource :branches do
      desc 'Return Branches.'
      get :branch do
        Branch.limit(10)
      end

      desc 'Create a branch.'
      params do
        requires :name, type: String, desc: 'Your name.'
      end
      post '/create'do
        Branch.create_branch(params)
      end
    end

  end
end
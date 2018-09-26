module Bank
  class CustomerAPI < Grape::API

    resource :customers do
      desc 'Return Customers.'
      get :customer do
        Customer.list_customer
      end

      desc 'Find Customer.'
      params do
        requires :id, type: String, desc: 'Your Id.'
      end
      get '/customer/:id/edit' do
        Customer.find(params[:id])
      end

      desc 'Update Customer.'
      params do
        requires :id, type: String, desc: 'Your Id.'
        requires :name, type: String, desc: 'Your name.'
        requires :email, type: String, desc: 'Your email.'
        requires :phone, type: Integer, desc: 'Your phone.'
      end
      put '/customer/:id' do
        Customer.update_customer(params)
      end

      desc 'Deactivate Customer.'
      params do
        requires :id, type: String, desc: 'Your Id.'
      end
      put '/customer/:id/deactivate' do
        c = Customer.find(params[:id])
        c.deactivate()
      end

      desc 'Activate Customer.'
      params do
        requires :id, type: String, desc: 'Your Id.'
      end
      put '/customer/:id/activate' do
        c = Customer.find(params[:id])
        c.activate()
      end

      desc 'Create a customer.'
      params do
        requires :name, type: String, desc: 'Your name.'
        requires :email, type: String, desc: 'Your email.'
        requires :phone, type: Integer, desc: 'Your phone.'
      end
      post '/create'do
        Customer.create_customer(params)
      end


    end

  end
end
module Bank
  class AccountAPI < Grape::API

    resource :accounts do
      desc 'Return Accounts.'
      params do
        requires :customer_id, type: Integer, desc: 'Your customer_id Id.'
      end
      get :account do
        Account.where(customer_id: params[:customer_id]).all
      end

      desc 'Find Account.'
      params do
        requires :customer_id, type: Integer, desc: 'Your customer_id Id.'
      end
      get '/account/:customer_id/edit' do
        Account.where(customer_id: params[:customer_id]).first
      end

      # desc 'Account Deposit.'
      # params do
      #   requires :customer_id, type: Integer, desc: 'Your customer_id.'
      #   requires :opened_date, type: Date, desc: 'Your opened_date.'
      #   requires :balance, type: BigDecimal, desc: 'Your balance.'
      #   requires :meta_name, type: String, desc: 'Your meta_name.'
      # end
      # put '/account/:id' do
      #   Account.account_deposit(params)
      # end

      desc 'Deactivate Account.'
      params do
        requires :id, type: String, desc: 'Your Id.'
      end
      put '/account/:id/deactivate' do
        a = Account.find(params[:id])
        a.deactivate()
      end

      desc 'Activate Account.'
      params do
        requires :id, type: String, desc: 'Your Id.'
      end
      put '/account/:id/activate' do
        a = Account.find(params[:id])
        a.activate()
      end

      desc 'Transfer Amount.'
      params do
        requires :id, type: String, desc: 'Your Id.'
        requires :to_id, type: String, desc: 'To_id Id.'
        requires :balance, type: BigDecimal, desc: 'Your balance.'
      end
      put '/account/:id/transfer' do
        a = Account.find(params[:id])
        a.account_transfer(params)
      end

      desc 'Withdraw Amount.'
      params do
        requires :id, type: String, desc: 'Your Id.'
        requires :balance, type: BigDecimal, desc: 'Your balance.'
      end
      put '/account/:id/withdraw' do
        a = Account.find(params[:id])
        a.account_withdraw(params)
      end

      desc 'Deposit Amount.'
      params do
        requires :id, type: String, desc: 'Your Id.'
        requires :balance, type: BigDecimal, desc: 'Your balance.'
      end
      put '/account/:id/deposit' do
        a = Account.find(params[:id])
        a.account_deposit(params)
      end

      desc 'Create a Account.'
      params do
        requires :customer_id, type: Integer, desc: 'Your customer_id.'
        requires :opened_date, type: Date, desc: 'Your opened_date.'
        requires :balance, type: BigDecimal, desc: 'Your balance.'
        requires :meta_name, type: String, desc: 'Your meta_name.'
      end
      post '/create'do
        Account.create_account(params)
      end


    end

  end
end
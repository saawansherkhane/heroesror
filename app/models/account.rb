class Account < ApplicationRecord
  belongs_to :customer
  has_many :account_transactions

  def list_account()
    if !self.status?
      account
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def self.create_account(account_attrs)
    customer = Customer.find(account_attrs[:customer_id])
    if customer
      account = Account.create!(customer_id: customer.id, opened_date: account_attrs[:opened_date], balance: account_attrs[:balance], meta_name: account_attrs[:meta_name], status: true)
      account_transaction = AccountTransaction.create!(account_id: account.id, amount: account.balance, to_id: account.id, from_id: account.id)
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def account_transfer(acc_attrs)
    account = Account.find(acc_attrs[:to_id])
    AccountTransaction.create!(account_id: id, amount: acc_attrs[:balance], description: "Transfered #{acc_attrs[:balance]} to #{account.id}", to_id: account.id, from_id: id)
    AccountTransaction.create!(account_id: account.id, amount: acc_attrs[:balance], description: "Credited Amount #{acc_attrs[:balance]} from  #{id}", to_id: account.id, from_id: id)
    account.update_attribute(:balance, balance + acc_attrs[:balance])
    update_attribute(:balance, balance - acc_attrs[:balance])
  end

  def account_withdraw(acc_attrs)
    AccountTransaction.create!(account_id: id, amount: acc_attrs[:balance], description: "Debited Amount #{acc_attrs[:balance]} to #{id}", to_id: id, from_id: id)
    update_attribute(:balance, balance - acc_attrs[:balance])
  end

  def account_deposit(acc_attrs)
    AccountTransaction.create!(account_id: id, amount: acc_attrs[:balance], description: "Credited Amount #{acc_attrs[:balance]} to #{id}", to_id: id, from_id: id)
    update_attribute(:balance, balance + acc_attrs[:balance])
  end

  def activate()
    if !self.status?
      update_attribute(:status, true)
    else
      raise ActiveRecord::RecordInvalid
    end
  end

  def deactivate()
    if self.status?
      update_attribute(:status, false)
    else
      raise ActiveRecord::RecordInvalid
    end
  end

end

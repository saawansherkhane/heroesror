class Customer < ApplicationRecord
  has_one :account
  belongs_to :branch
  # validates_presence_of :customer_id

  def self.create_customer(customer_attrs)
     Customer.create!(name: customer_attrs[:name], email: customer_attrs[:email], phone: customer_attrs[:phone], branch_id: 1, status: true)
  end

  def self.update_customer(customer_attrs)
    customer = Customer.find(customer_attrs[:id])
    if customer
      customer.update_attributes(name: customer_attrs[:name], email: customer_attrs[:email], phone: customer_attrs[:phone])
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


  def activate()
    if !self.status?
      update_attribute(:status, true)
    else
      raise ActiveRecord::RecordInvalid
    end
  end

  def self.list_customer
     Customer.all
  end

end

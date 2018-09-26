class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.boolean :status
      t.integer :branch_id

      t.timestamps
    end
  end
end

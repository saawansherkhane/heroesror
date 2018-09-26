class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.date :opened_date
      t.decimal :balance, :default => 0.0
      t.string :meta_name
      t.boolean :status

      t.timestamps
    end
  end
end

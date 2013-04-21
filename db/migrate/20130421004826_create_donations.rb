class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :name
      t.string :country
      t.string :state
      t.string :district
      t.string :transaction_id
      t.integer :amount
      t.datetime :date

      t.timestamps
    end
  end
end

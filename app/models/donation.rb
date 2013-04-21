class Donation < ActiveRecord::Base
  attr_accessible :amount, :country, :date, :district, :name, :state, :transaction_id
end

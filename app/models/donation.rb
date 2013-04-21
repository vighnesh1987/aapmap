class Donation < ActiveRecord::Base
  attr_accessible :amount, :country, :date, :district, :name, :state, :transaction_id
  COL_MAP = {
              name: 1,
              country: 2,
              state: 3,
              district: 4,
              transaction_id: 5,
              amount: 6,
              date: 7
            }

  def self.parse arr
    donation = Donation.new
    COL_MAP.each do |field, index|
      donation.send(field.to_s + '=' , arr[index])
    end
    donation
  end

end

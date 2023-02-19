class Customer < ApplicationRecord
    validates :customer_name, presence: true
    validates :mobile_number, length: { is: 11 }
    validates :pax, length: { in: 1..2 }
end

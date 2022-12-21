class Tenant < ApplicationRecord
    has_many :apartments
    has_many :leases

    validates :name, presence: true
    validates :age, 
end

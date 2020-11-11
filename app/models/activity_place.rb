class ActivityPlace < ApplicationRecord
    has_many :activities
    
    validates :Name, presence: true
    validates :Address, presence: true
end

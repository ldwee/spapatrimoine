class ActivityPlace < ApplicationRecord
    validates :Name, presence: true
    validates :Address, presence: true
    has_many :activities
end

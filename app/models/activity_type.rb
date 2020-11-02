class ActivityType < ApplicationRecord
    validates :title, presence: true
    has_many :activities
end

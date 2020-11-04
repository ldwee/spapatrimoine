class Activity < ApplicationRecord
    validates :description, presence: true
    validates :title, presence: true
    validates :status, presence: true, inclusion: { in: %w(attente acceptée refusée)}
    belongs_to :activity_type
    belongs_to :activity_place
    has_many :actualities
end

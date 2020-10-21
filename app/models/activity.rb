class Activity < ApplicationRecord
    validates :description, presence: true
    validates :title, presence: true
    validates :status, presence: true, inclusion: { in: %w(attente acceptée refusée)}

end

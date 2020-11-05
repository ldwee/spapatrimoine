class Actuality < ApplicationRecord
    validates :description, presence: true
    validates :titre, presence: true
    validates :status, presence: true, inclusion: { in: %w(attente acceptée refusée classée)}
    belongs_to :activity, optional: true
end
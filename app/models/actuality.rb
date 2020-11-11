class Actuality < ApplicationRecord
    belongs_to :activity, optional: true
    belongs_to :contributor
    belongs_to :patrimoine, optional: true

    validates :titre, presence: true
    validates :description, presence: true
    validates :status, presence: true, inclusion: { in: %w(attente acceptée refusée classée)}
end
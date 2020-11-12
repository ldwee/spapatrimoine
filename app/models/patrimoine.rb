class Patrimoine < ApplicationRecord
    belongs_to :contributor
    has_many :activities
    has_many :actualities

    validates :libelle, presence: true
    validates :localisation, presence: true
    validates :notice, presence: true
    validates :etat, presence: true
    validates :status, presence: true, inclusion: { in: %w(attente acceptée refusée)}
end

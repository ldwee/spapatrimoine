class Patrimoine < ApplicationRecord
    belongs_to :contributor
    has_many :activities
    has_many :actualities
    
    validates :libelle, presence: true
    validates :localisation, presence: true
end

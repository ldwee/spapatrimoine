class Patrimoine < ApplicationRecord
    belongs_to :contributor
    has_many :activities
    has_many :actualities
end

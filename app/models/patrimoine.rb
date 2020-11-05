class Patrimoine < ApplicationRecord
    has_many :activities
    has_many :actualities
end

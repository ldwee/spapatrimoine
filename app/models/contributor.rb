class Contributor < ApplicationRecord
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    has_many :activities
    has_many :actualities
    has_many :patrimoines
end

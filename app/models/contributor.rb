class Contributor < ApplicationRecord
  has_many :activities
  has_many :actualities
  has_many :patrimoines

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email,
            presence: true,
            format: { with: /\A(.+)@(.+)\z/, message: "Email invalid" },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
end

class Patrimoine < ApplicationRecord
  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_localisation?

  belongs_to :contributor

  has_many :activities
  has_many :actualities

  has_many_attached :images

  validates :libelle, presence: true
  validates :localisation, presence: true
  validates :notice, presence: true
  validates :etat, presence: true
  validates :status, presence: true, inclusion: { in: %w(attente acceptée refusée)}
end

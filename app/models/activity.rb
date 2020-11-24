class Activity < ApplicationRecord
  belongs_to :activity_type, optional: true
  belongs_to :activity_place, optional: true
  has_many :actualities, dependent: :nullify
  belongs_to :contributor
  belongs_to :patrimoine, optional: true

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: %w(attente stock acceptée refusée)}
end

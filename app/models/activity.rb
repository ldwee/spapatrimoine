class Activity < ApplicationRecord
  belongs_to :activity_type
  belongs_to :activity_place
  has_many :actualities, dependent: :nullify
  belongs_to :contributor
  belongs_to :patrimoine, optional: true

  validates :description, presence: true
  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w(attente acceptée refusée)}

end

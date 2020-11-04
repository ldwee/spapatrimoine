class Theme < ApplicationRecord
    validates :nom, presence: true
end

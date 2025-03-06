class Task < ApplicationRecord
  belongs_to :list, required: true

  validates :description, presence: true
end

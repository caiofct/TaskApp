class Task < ApplicationRecord
  belongs_to :list, required: true
end

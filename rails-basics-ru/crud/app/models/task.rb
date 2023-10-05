class Task < ApplicationRecord
  validates :name, :status, :creator, :completed, presence: true
  validates :completed, inclusion: [true, false]
end

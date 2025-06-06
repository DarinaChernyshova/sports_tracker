class Exercise < ApplicationRecord
    belongs_to :workout
    validates :name, :sets, :reps, presence: true
  end
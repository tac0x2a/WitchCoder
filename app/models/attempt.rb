class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  has_many :attempt_cases
end

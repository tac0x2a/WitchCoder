class Problem < ApplicationRecord
  belongs_to :user
  has_many :cases
  accepts_nested_attributes_for :cases, allow_destroy: true
end

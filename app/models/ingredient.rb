class Ingredient < ApplicationRecord
  searchkick

  has_many :doses

  validates :name, presence: true, uniqueness: true
end

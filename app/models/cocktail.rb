class Cocktail < ApplicationRecord
  searchkick

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  def search_data
    { name: name,
      ingredient_names: ingredients.map(&:name) }
  end
end

class Menu < ApplicationRecord
  has_one_attached :food_image
  has_many :foods, dependent: :destroy
end

class Drink < ApplicationRecord
  validates :name, :price, presence: true
end

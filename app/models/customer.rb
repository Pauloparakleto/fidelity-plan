class Customer < ApplicationRecord
  validates :name, :phone, :email, presence: true
end

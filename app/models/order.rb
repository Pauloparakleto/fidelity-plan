class Order < ApplicationRecord
  has_one :item, dependent: :destroy
  accepts_nested_attributes_for :item
end

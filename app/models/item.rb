class Item < ApplicationRecord

  belongs_to :order
  before_save :set_subtotal

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  def set_subtotal
    self.subtotal = price * quantity
  end
end

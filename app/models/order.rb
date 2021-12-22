class Order < ApplicationRecord
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true,
                                        reject_if: ->(attributes) { attributes["quantity"].blank? }

  def total
    items.sum { |item| item.price * item.quantity }
  end
end

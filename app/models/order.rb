class Order < ApplicationRecord
  attr_accessor :total

  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items

  before_save :set_total

  private

  def set_total
    @total = 0
    items.each do |item|
      @total += item.quantity*item.price
    end
    @total
  end
end

class Badge < ApplicationRecord
  enum status: { uno: 0 }
  validates :status, presence: true
end

class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :brand, presence: true
  validates :model, presence: true
  validates :address, presence: true
  validates :address, comparison: { greater_than: 0 }
end

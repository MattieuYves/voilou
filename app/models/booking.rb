class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :starts_at, presence: true
  validates :end_at, presence: true
end

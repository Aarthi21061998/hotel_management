class Accodamation < ApplicationRecord
  belongs_to :hotel
  validates :room_type, :room_number, :hotel_id, :parking_type,:food_acc,:offer, presence: true
  end

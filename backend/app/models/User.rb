class User < ApplicationRecord
    has_many :bookings
    has_many :room_users
    has_many :rooms, through: :room_users
end
  
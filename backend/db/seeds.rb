# db/seeds.rb

# Users
3.times do |i|
    User.create!(
      name: "User#{i + 1}",
      email: "user#{i + 1}@example.com",
      password_digest: "password",
      is_admin: false
    )
  end
  
  # Rooms
  3.times do |i|
    Room.create!(
      name: "Room#{i + 1}",
      description: "This is a description for Room#{i + 1}.",
      image_url: "https://example.com/image#{i + 1}.jpg",
      max_count: 4,
      phone_number: "123456789#{i}",
      rent_per_day: (i + 1) * 50,
      room_type: ["Single", "Double", "Suite"][i]
    )
  end
  
  # Bookings
  users = User.all
  rooms = Room.all
  
  3.times do |i|
    Booking.create!(
      user: users[i],
      room: rooms[i],
      from_date: Date.today + i.days,
      to_date: Date.today + (i + 3).days,
      total_days: 3,
      total_amount: rooms[i].rent_per_day * 3,
      status: "booked"
    )
  end
  
  # RoomUsers (assuming this model was meant to show which users have access to which rooms)
  users.each do |user|
    rooms.each do |room|
      RoomUser.create!(user: user, room: room)
    end
  end
  
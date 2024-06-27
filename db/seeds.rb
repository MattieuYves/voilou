# db/seeds.rb

require 'faker'

# Clear existing data
Booking.destroy_all
Car.destroy_all
User.destroy_all

# Create admin profil
mattieu = User.create!(
  email: "mattieu@test.fr",
  password: 'password',
  password_confirmation: 'password'
)

# Create random cars for mattieu
(1..3).to_a.sample.times do
  car = Car.create!(
    user: mattieu,
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year_of_production: Faker::Vehicle.year,
    address: Faker::Address.full_address,
    price_per_day: Faker::Commerce.price(range: 50.0..150.0)
  )

  # Create random bookings for each car
  (6..8).to_a.sample.times do
    start_date = Faker::Time.between(from: DateTime.now - 30, to: DateTime.now)
    end_date = start_date + rand(1..7).days
    Booking.create!(
      user: mattieu,
      car: car,
      starts_at: start_date,
      ends_at: end_date,
      accepted: [true, false].sample
    )
  end
end



# Create random users
(10..15).to_a.sample.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )

  # Create random cars for each user
  (1..3).to_a.sample.times do
    car = Car.create!(
      user: user,
      brand: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      year_of_production: Faker::Vehicle.year,
      address: Faker::Address.full_address,
      price_per_day: Faker::Commerce.price(range: 50.0..150.0)
    )

    # Create random bookings for each car
    (6..8).to_a.sample.times do
      start_date = Faker::Time.between(from: DateTime.now - 30, to: DateTime.now)
      end_date = start_date + rand(1..7).days
      Booking.create!(
        user: user,
        car: car,
        starts_at: start_date,
        ends_at: end_date,
        accepted: [true, false].sample
      )
    end
  end
end

puts "Seed data created successfully!"

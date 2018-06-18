# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

general_user = User.create!(
  first_name:"User", 
  last_name:"Smith", 
  email:"user@mail.com", 
  password:"123456"
)

admin_user = User.create!(
  first_name:"Admin", 
  last_name:"Smith", 
  email:"admin@mail.com", 
  password:"123456", 
  role:"admin"
)

class_event = Event.create!(
  general_price: 150,
  member_price: 40,
  tithe_price: 20,
  seats: 10,
  facilitator: "Rev. Barb",
  start_date: Date.today + 2.weeks,
  end_date: Date.today + 8.weeks,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  title: "Class 101",
  credits: "NC",
  schedule: "Monday-Thursday 6-8pm",
  event_type: "class"
)

event = Event.create!(
  general_price: 150,
  member_price: 40,
  tithe_price: 20,
  seats: 14,
  facilitator: "Rev. Barb",
  start_date: Date.today + 4.weeks,
  end_date: Date.today + 4.weeks,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  title: "Event",
  schedule: "#{(Date.today + 4.weeks).strftime("%A")} 6-8pm",
  event_type: "event"
)

Registration.create!(
  event: class_event,
  first_name: "Jane",
  last_name: "Doe",
  email: "jane@mail.com",
  phone: "303-333-3333",
  comment: "Please confirm my registration, thank you!"
)

Registration.create!(
  event: event,
  first_name: general_user.first_name,
  last_name: general_user.last_name,
  email: general_user.email,
  phone: "970-444-4444",
  user: general_user,
  comment: "Please confirm my registration, thank you!"
)

PrayerRequest.create!(
  name: "Jane Doe",
  email: "jane@mail.com",
  method: "in_person",
  phone: "303-333-3333",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
)

PrayerRequest.create!(
  name: "#{general_user.first_name} #{general_user.last_name}",
  email: general_user.email,
  method: "phone",
  phone: "970-444-4444",
  user: general_user,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
)

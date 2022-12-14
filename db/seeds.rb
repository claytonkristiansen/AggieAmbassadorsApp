# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create!([{ email: 'kristiansenc@tamu.edu', privilege_level: 30, position_title: 'Member' }])
Member.create!([{ email: 'jdf0001045432@tamu.edu', privilege_level: 30, position_title: 'Member' }])
Member.create!([{ email: 'feierc@tamu.edu', privilege_level: 30, position_title: 'Member' }])
Member.create!([{ email: 'soccra74@tamu.edu', privilege_level: 30, position_title: 'Member' }])
Member.create!([{ email: 'ernest@tamu.edu', privilege_level: 30, position_title: 'Member' }])
Member.create!([{ email: 'kylewmccall@tamu.edu', privilege_level: 30, position_title: 'Member' }])
Member.create!([{ email: 'paulinewade@tamu.edu', privilege_level: 30, position_title: 'Member' }])
Member.create!([{ email: 'bhanu@tamu.edu', privilege_level: 30, position_title: 'Member' }])
Member.create!([{ email: 'numisha@tamu.edu', privilege_level: 30, position_title: 'Member' }])

Organization.create!([{ name: 'Example Organization 1' }])
Organization.create!([{ name: 'Example Organization 2' }])
Organization.create!([{ name: 'Example Organization 3' }])
Organization.create!([{ name: 'Example Organization 4' }])


Location.create!([{name: 'Zoom Room 1', address: 'https://zoom.us/join/5978873496786' }])
Location.create!([{name: 'Zoom Room 2', address: 'https://zoom.us/join/873462378678678' }])


Event.create!([{ title: 'Example Event 1', event_date: '2022-10-01', location_id: 1 }])

#Event.create!([{ title: 'Example Event 2', event_date: '2022-10-02' }])
#Event.create!([{ title: 'Example Event 3', event_date: '2022-10-03' }])
#Event.create!([{ title: 'Example Event 4', event_date: '2022-10-04' }])

AttendanceRecord.create!([{ member_id: 5, event_id: 1, confirmed_attending: true, attended: true }])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


TimeSlot.create(:start_time => "2013-10-26 8:00", :end_time => "2013-10-26 9:00")
TimeSlot.create(:start_time => "2013-10-26 9:00", :end_time => "2013-10-26 9:15")
TimeSlot.create(:start_time => "2013-10-26 9:15", :end_time => "2013-10-26 10:00") #1
TimeSlot.create(:start_time => "2013-10-26 10:00", :end_time => "2013-10-26 10:15") 
TimeSlot.create(:start_time => "2013-10-26 10:15", :end_time => "2013-10-26 11:00") #2
TimeSlot.create(:start_time => "2013-10-26 11:00", :end_time => "2013-10-26 11:15")
TimeSlot.create(:start_time => "2013-10-26 11:15", :end_time => "2013-10-26 12:00") #3
TimeSlot.create(:start_time => "2013-10-26 12:00", :end_time => "2013-10-26 13:15") #  Lunch
TimeSlot.create(:start_time => "2013-10-26 13:15", :end_time => "2013-10-26 13:45") #4
TimeSlot.create(:start_time => "2013-10-26 13:45", :end_time => "2013-10-26 14:00") 
TimeSlot.create(:start_time => "2013-10-26 14:00", :end_time => "2013-10-26 14:30") #5
TimeSlot.create(:start_time => "2013-10-26 14:15", :end_time => "2013-10-26 14:45")
TimeSlot.create(:start_time => "2013-10-26 14:45", :end_time => "2013-10-26 15:00") #6
TimeSlot.create(:start_time => "2013-10-26 15:00", :end_time => "2013-10-26 15:30")
TimeSlot.create(:start_time => "2013-10-26 15:30", :end_time => "2013-10-26 16:00") #7
TimeSlot.create(:start_time => "2013-10-26 16:30", :end_time => "2013-10-26 17:00") # End


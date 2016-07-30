# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# import Tau.csv
tau_fam = Family.find_or_create_by(name: 'Tau')
# Faith Milazzo is the founding father, so put her in first
Brother.create(first_name: 'Faith', last_name: 'Milazzo', status: 'Alumni')
require 'csv'
CSV.foreach("/Users/drew/Code/otter/db/csv_data/Tau.csv") do |line|
  # get name info
  name = line[1].split(" ")
  first_name, last_name = [name[0], name[1]]
  status = line[6]
  new_bro = Brother.create(first_name: first_name, last_name: last_name, status: status)
  new_bro.family = tau_fam
  # add their rush class
  rc_year = line[4][0..3].to_i
  if line[4][4] == "F"
    rc_sem = "Fall"
  else
    rc_sem = "Spring"
  end
  rc_greek_name = line[5]
  rush_class = RushClass.find_or_create_by(greek_name: rc_greek_name, year: rc_year, semester: rc_sem)
  new_bro.rush_class = rush_class
  # add their big
  big_name = line[3].split(" ")
  big = Brother.find_by(first_name: big_name[0], last_name: big_name[1])
  new_bro.parent = big
  new_bro.save
end

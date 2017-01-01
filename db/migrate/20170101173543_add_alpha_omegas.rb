class AddAlphaOmegas < ActiveRecord::Migration
  def up
    ao = RushClass.find_or_create_by(greek_name: 'Alpha Omega', year: 2015, semester: 'Fall')
    alpha_omegas = [
      { name: 'Mark Kim', big_brother: 'Laurel Petrulionis' },
      { name: 'Matt Gribbin', big_brother: 'Drew Higgins' },
      { name: 'Jamie Ranalli', big_brother: 'Kendra Reynolds' },
      { name: 'Abigail Van Pelt', big_brother: 'Katelyn Maltais' },
      { name: 'Nhi Hoang', big_brother: 'Leah Robertson' },
      { name: 'Megan Butter', big_brother: 'Amanda Winkler' },
      { name: 'Kody Kem', big_brother: 'Carly Colavecchi' },
      { name: 'Garrett Coyne', big_brother: 'Amy Bodnar' },
      { name: 'Mara Villalongo', big_brother: 'Laurel Petrulionis' },
      { name: 'Christine Suhr', big_brother: 'Kyle Sawyer' },
      { name: 'Patrick Duda', big_brother: 'Jami Reber' },
      { name: 'Danny Gao', big_brother: 'Rachel Kinkade', status: 'Resigned' },
      { name: 'Brian Hughes', big_brother: 'Matt Rea' }
    ]

    alpha_omegas.each do |bro|
      status = bro[:status] || 'Active'
      name = bro[:name].split(' ', 2)
      big_name = bro[:big_brother].split(' ', 2)
      big = Brother.find_by(first_name: big_name[0], last_name: big_name[1])
      Brother.create(first_name: name[0], last_name: name[1], family: big.family, status: status, rush_class: ao, parent: big)
    end
  end

  def down
    ao = RushClass.find_by(greek_name: 'Alpha Omega')
    aos = Brother.where(rush_class: ao).each do |bro|
      bro.destroy
    end
    ao.destroy
  end
end

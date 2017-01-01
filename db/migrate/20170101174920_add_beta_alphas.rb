class AddBetaAlphas < ActiveRecord::Migration
  def up
    ba = RushClass.find_or_create_by(greek_name: 'Beta Alpha', year: 2016, semester: 'Spring')
    beta_alphas = [
      { name: 'Joseph Yu', big: 'Mark Kim' },
      { name: 'Faris Bouran', big: 'Kody Kem' },
      { name: 'Becca Ho', big: 'Mara Villalongo' },
      { name: 'Erik Arroyo', big: 'Derek Reigel' },
      { name: 'Eva Barranco', big: 'Zoe Zhang' },
      { name: 'Jake Ryan', big: 'Amanda Winkler' },
      { name: 'Julia Chen', big: 'Nhi Hoang' },
      { name: 'Kevin Parlak', big: 'Garrett Coyne' },
      { name: 'Khushali Patel', big: 'Christine Suhr' },
      { name: 'Mallory Barbee', big: 'Allison Amendola' },
      { name: 'Nick Corona', big: 'Chris Russell' },
      { name: 'Nish Patel', big: 'Dhruvish Mehta' },
      { name: 'Sarah Menna', big: 'Abigail Van Pelt' }
    ]

    beta_alphas.each do |bro|
      status = bro[:status] || 'Active'
      name = bro[:name].split(' ', 2)
      big_name = bro[:big].split(' ', 2)
      big = Brother.find_by(first_name: big_name[0], last_name: big_name[1])
      Brother.create(first_name: name[0], last_name: name[1], family: big.family, status: status, rush_class: ba, parent: big)
    end
  end

  def down
    ba = RushClass.find_by(greek_name: 'Alpha Omega')
    bas = Brother.where(rush_class: ba).each do |bro|
      bro.destroy
    end
    ba.destroy
  end
end

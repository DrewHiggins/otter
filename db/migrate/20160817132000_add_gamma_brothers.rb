class AddGammaBrothers < ActiveRecord::Migration
  def up
    gamma_fam = Family.find_or_create_by(name: 'Gamma')
    Brother.create(first_name: 'Belinda', last_name: 'Bell', status: 'Alumni', family_id: gamma_fam.id)
    require 'csv'
    orphans = [] # to store bros who come earlier than their bigs in the list
    CSV.foreach("#{ENV["OTTER_ROOT"]}/db/csv_data/Gamma.csv") do |line|
      # get name info
      name = line[1].split(" ")
      first_name, last_name = [name[0], name[1]]
      status = line[6]
      new_bro = Brother.create(first_name: first_name, last_name: last_name, status: status)
      new_bro.family = gamma_fam
      # add their rush class
      rc_year = line[4].split(" ")[1].to_i
      if line[4].include? "Fall"
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
      unless big.nil?
        new_bro.parent = big
      else
        orphans.push({ brother: new_bro, big_name: big_name})
      end
      new_bro.save
    end

    orphans.each do |orphan|
      brother = orphan[:brother]
      big = Brother.find_by(first_name: orphan[:big_name][0], last_name: orphan[:big_name][1])
      brother.parent = big unless big.nil?
      brother.save
    end
  end

  def down
    @gamma = Family.find_by(name: 'Gamma')
    unless @gamma.nil?
      Brother.where(family_id: @gamma.id).each do |brother|
        brother.destroy
      end
      @gamma.destroy
    end
  end
end

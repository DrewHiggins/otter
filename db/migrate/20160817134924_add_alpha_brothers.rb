class AddAlphaBrothers < ActiveRecord::Migration
  def up
    alpha_fam = Family.find_or_create_by(name: 'Alpha')
    rc = RushClass.find_or_create_by(semester: 'Fall', year: 1992, greek_name: 'Beta')
    bro0 = Brother.create(first_name: 'Jodi', last_name: 'Angel', status: 'Alumni', family_id: alpha_fam.id)
    bro1 = Brother.create(first_name: 'Heather', last_name: 'Salko', status: 'Alumni', rush_class_id: rc.id, parent_id: bro0.id, family_id: alpha_fam.id)
  end

  def down
    alpha_fam = Family.find_by(name: 'Alpha')
    unless alpha_fam.nil?
      Brother.where(family_id: alpha_fam.id).each do |brother|
        brother.destroy
      end
      alpha_fam.destroy
    end
  end
end

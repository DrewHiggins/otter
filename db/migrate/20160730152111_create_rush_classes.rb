class CreateRushClasses < ActiveRecord::Migration
  def change
    create_table :rush_classes do |t|
      t.string :greek_name
      t.integer :year
      t.boolean :semester
      t.date :initiation_date

      t.timestamps null: false
    end
  end
end

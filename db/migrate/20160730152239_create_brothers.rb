class CreateBrothers < ActiveRecord::Migration
  def change
    create_table :brothers do |t|
      t.string :first_name
      t.string :last_name
      t.references :family, index: true, foreign_key: true
      t.references :branch, index: true, foreign_key: true
      t.references :rush_class, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end

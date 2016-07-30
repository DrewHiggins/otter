class ChangeSemesterToSpringInRushClasses < ActiveRecord::Migration
  def change
    change_column :rush_classes, :semester, :string
    remove_column :rush_classes, :initiation_date 
  end
end

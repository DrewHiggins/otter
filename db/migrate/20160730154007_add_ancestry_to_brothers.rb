class AddAncestryToBrothers < ActiveRecord::Migration
  def change
    add_column :brothers, :ancestry, :string
  end
end

class AddDefaultUsers < ActiveRecord::Migration
  def up
    # create the default, catch-all brother account
    @brother = User.new
    @brother.username = 'brother'
    @brother.password = 'psp'
    @brother.save
    # create the historian's admin account
    @historian = User.new
    @historian.username = 'historian'
    @historian.password = 'history'
    @historian.save
  end

  def down
    User.find_by(username: 'historian').destroy
    User.find_by(username: 'brother').destroy
  end
end

class ChangeLikesDefault < ActiveRecord::Migration
  def change
  	change_column_default :photos, :likes, 0
  
  end
end

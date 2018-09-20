class AddColumnUserplan < ActiveRecord::Migration[5.2]
  def change
    add_column :userplans, :satisfied, :integer
  end
end

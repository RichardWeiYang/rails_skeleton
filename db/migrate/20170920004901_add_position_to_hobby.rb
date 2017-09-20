class AddPositionToHobby < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :position, :integer
  end
end

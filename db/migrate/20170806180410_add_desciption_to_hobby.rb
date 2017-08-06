class AddDesciptionToHobby < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :description, :text
  end
end

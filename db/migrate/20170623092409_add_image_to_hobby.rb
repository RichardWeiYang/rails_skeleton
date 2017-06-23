class AddImageToHobby < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :image, :string
  end
end

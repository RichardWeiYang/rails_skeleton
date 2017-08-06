class AddDateToHobby < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :popular_time, :date
  end
end

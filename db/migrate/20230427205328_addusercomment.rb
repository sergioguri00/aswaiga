class Addusercomment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_full_name, :string
  end
end

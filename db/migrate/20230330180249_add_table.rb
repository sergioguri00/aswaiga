class AddTable < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :tipus
      t.string :severity
      t.string :priority
      t.string :issue, null: false
      t.string :status
      t.string :assign_to

      t.timestamps
    end
  end
end

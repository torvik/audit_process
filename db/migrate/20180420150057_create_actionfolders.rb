class CreateActionfolders < ActiveRecord::Migration[5.1]
  def change
    create_table :actionfolders do |t|
      t.integer :identifier
      t.string :folder
      t.string :lawyer
      t.date :low_date
      t.date :closing_date
      t.string :status
      t.string :action_result
      t.string :uf

      t.timestamps
    end
  end
end

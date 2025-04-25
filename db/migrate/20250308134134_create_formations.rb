class CreateFormations < ActiveRecord::Migration[7.1]
  def change
    create_table :formations do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :picture
      t.date :date

      t.timestamps
    end
  end
end

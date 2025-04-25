class CreateProjets < ActiveRecord::Migration[7.1]
  def change
    create_table :projets do |t|
      t.string :title
      t.text :description
      t.date :dateStart
      t.date :dateEnd
      t.string :type
      t.string :reference
      t.string :image

      t.timestamps
    end
  end
end

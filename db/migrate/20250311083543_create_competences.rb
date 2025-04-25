class CreateCompetences < ActiveRecord::Migration[7.1]
  def change
    create_table :competences do |t|
      t.string :title
      t.string :level

      t.timestamps
    end
  end
end

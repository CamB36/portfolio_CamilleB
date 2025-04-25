class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :description
      t.string :link
      t.string :picture
      t.date :date
      t.date :endDate
      t.string :company

      t.timestamps
    end
  end
end

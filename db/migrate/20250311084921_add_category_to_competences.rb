class AddCategoryToCompetences < ActiveRecord::Migration[7.1]
  def change
    add_reference :competences, :category, null: false, foreign_key: true
  end
end

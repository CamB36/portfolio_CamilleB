class AddLogoToCompetences < ActiveRecord::Migration[7.1]
  def change
    add_column :competences, :logo, :string
  end
end

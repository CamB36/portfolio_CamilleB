class AddEcoleToFormations < ActiveRecord::Migration[7.1]
  def change
    add_column :formations, :ecole, :string
  end
end

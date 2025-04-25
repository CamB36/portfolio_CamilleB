class RenameTypeColumnInProjets < ActiveRecord::Migration[7.1]
  def change
    rename_column :projets, :type, :projet_type
  end
end

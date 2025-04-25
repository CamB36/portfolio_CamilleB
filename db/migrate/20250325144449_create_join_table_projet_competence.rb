class CreateJoinTableProjetCompetence < ActiveRecord::Migration[7.1]
  def change
    create_join_table :projets, :competences do |t|
      t.index :projet_id
      t.index :competence_id
    end
  end
end

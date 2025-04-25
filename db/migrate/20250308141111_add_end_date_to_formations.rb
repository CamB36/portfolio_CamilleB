class AddEndDateToFormations < ActiveRecord::Migration[7.1]
  def change
    add_column :formations, :endDate, :date
  end
end

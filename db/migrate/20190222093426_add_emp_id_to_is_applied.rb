class AddEmpIdToIsApplied < ActiveRecord::Migration[5.2]
  def change
  	add_column :applieds, :emp_id, :integer
  end
end

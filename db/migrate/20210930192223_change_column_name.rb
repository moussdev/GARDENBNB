class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :gardens, :type, :land
  end
end

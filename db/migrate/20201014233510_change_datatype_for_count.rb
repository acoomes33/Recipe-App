class ChangeDatatypeForCount < ActiveRecord::Migration[6.0]
  def up
    change_column :ingredients, :count, :float
  end

  def down
    change_column :ingredients, :count, :integer
  end
end

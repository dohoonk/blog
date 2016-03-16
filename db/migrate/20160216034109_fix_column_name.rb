class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :catagory, :category
  end
end

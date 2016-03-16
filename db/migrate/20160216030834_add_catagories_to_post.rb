class AddCatagoriesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :catagory, :string
  end
end

class ChangeDescriptionDataType < ActiveRecord::Migration
  def up
    remove_column :shows, :description
    add_column :shows, :description, :text
  end
  def down
    remove_column :shows, :description
    add_column :shows, :description, :string
  end
end

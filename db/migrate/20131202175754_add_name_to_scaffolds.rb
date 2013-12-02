class AddNameToScaffolds < ActiveRecord::Migration
  def change
    add_column :scaffolds, :name, :string
  end
end

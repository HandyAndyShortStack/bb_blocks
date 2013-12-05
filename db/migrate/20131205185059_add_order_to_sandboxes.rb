class AddOrderToSandboxes < ActiveRecord::Migration
  def change
    add_column :sandboxes, :order, :text
  end
end

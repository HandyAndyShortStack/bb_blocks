class CreateSandboxes < ActiveRecord::Migration
  def change
    create_table :sandboxes do |t|
      t.string :name
      t.integer :page_id

      t.timestamps
    end
  end
end

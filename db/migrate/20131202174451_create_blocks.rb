class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :type
      t.text :options
      t.integer :sandbox_id

      t.timestamps
    end
  end
end

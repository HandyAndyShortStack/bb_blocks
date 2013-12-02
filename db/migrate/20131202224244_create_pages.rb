class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.integer :site_id
      t.integer :template_id
      t.string :title
      t.text :options

      t.timestamps
    end
  end
end

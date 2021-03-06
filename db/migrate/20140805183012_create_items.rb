class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.float :price
      t.belongs_to :category
      t.timestamp null: false
    end
  end
end

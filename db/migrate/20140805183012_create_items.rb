class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :category
      t.string :title
      t.integer :inventory
      t.decimal :price, precision: 8, scale: 2
      t.timestamp null: false
    end
  end
end

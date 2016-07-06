class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :item
      t.belongs_to :cart
      t.integer :quantity, default: 0
      t.timestamp null: false
    end
  end
end

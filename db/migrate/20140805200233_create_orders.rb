class CreateOrders < ActiveRecord::Migration
  def change
    create_table :order do |t|
      t.belongs_to :user
      t.belongs_to :cart
    end
  end
end

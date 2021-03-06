class Cart < ActiveRecord::Base
  has_many :items, through: :line_items
  has_many :line_items
  belongs_to :user
  has_many :orders
  has_many :users

  def total
    total = 0
    line_items.each do |line_item|
       total += line_item.item.price * line_item.quantity
    end
    total
  end

  def add_item(item_id)
    lineItem = self.line_items.find_by(item_id: item_id)
    if lineItem
      lineItem.quantity += 1
    else
      lineItem = self.line_items.build(item_id: item_id)
    end
    return lineItem
  end

  def checkout
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    status = "submitted"
    save
  end

end

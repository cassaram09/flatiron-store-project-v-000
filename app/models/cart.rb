class Cart < ActiveRecord::Base
  has_many :items, through: :line_items
  has_many :line_items
  belongs_to :user
  has_many :orders

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
      self.line_items.create(item_id: item_id)

    end
    return lineItem
  end

end

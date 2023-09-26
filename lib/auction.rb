class Auction
  attr_reader :items

  def initialize
    @items = []
  end
  
  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    unpopular = []
    @items.each do |item|
      if item.bids.empty?
        unpopular << item
      end
    end
    unpopular
  end

  def potential_revenue
    revenue = []
    @items.each do |item|
      if item.bids.empty? == false
        revenue << item.current_high_bid
      end
    end
    revenue.sum
  end
end
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

  def bidders
    bidder_names = []
    @items.each do |item|
      item.bids.each do |attendee, bids|
        bidder_names << attendee.name
      end
    end
    bidder_names.uniq
  end

  def bidder_info
    info = {}
    @items.each do |item|
      item.bids.each do |attendee, bids|
        info[attendee] = {
          budget: attendee.budget,
          items:  bid_item(attendee), 
        }
      end
    end
    info
  end
  
  def bid_item(attendee)
    bid_items = []
    @items.find_all do |item|
      if !item.bids.empty? && item.bids.include?(attendee)
        bid_items << item
      end
    end
    bid_items
  end

end
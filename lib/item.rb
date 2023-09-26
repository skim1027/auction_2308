class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid_price)
    @bids[attendee] = bid_price
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    
  end
end
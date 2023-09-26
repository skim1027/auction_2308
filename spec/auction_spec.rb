require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  let(:auction) { Auction.new }
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }

  describe '#initialize' do
    it 'initialize' do
      expect(auction).to be_a(Auction)
    end

    it 'has an empty items at first' do
      expect(auction.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds items' do
      auction.add_item(item1)
      auction.add_item(item2)
      expect(auction.items).to eq([item1, item2])
    end
  end

  describe '#item_names' do
    it 'list item names' do
      auction.add_item(item1)
      auction.add_item(item2)
      expect(auction.item_names).to eq(['Chalkware Piggy Bank','Bamboo Picture Frame'])
    end
  end
end
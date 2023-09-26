require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:item3) { Item.new('Homemade Chocolate Chip Cookies') }
  let(:item4) { Item.new('2 Days Dogsitting') }
  let(:item5) { Item.new('Forever Stamps') }
  let(:attendee1) { Attendee.new({name: 'Megan', budget: '$50'})}
  let(:attendee2) { Attendee.new({name: 'Bob', budget: '$75'})}
  let(:attendee3) { Attendee.new({name: 'Mike', budget: '$100'})}

  describe '#initialize' do
    it 'initialize' do
      expect(item1).to be_a(Item)
      expect(item2).to be_a(Item)
    end

    it 'has empty bids at first' do
      expect(item1.bids).to eq({})
      expect(item2.bids).to eq({})
    end

    it 'has a name' do
      expect(item1.name).to eq('Chalkware Piggy Bank')
      expect(item2.name).to eq('Bamboo Picture Frame')
    end
  end

  describe '#add_bid' do
    it 'adds bids' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.bids).to be_a(Hash)
      expect(item1.bids.keys.first.class).to eq(Attendee)
      expect(item1.bids).to eq({attendee1 => 22, attendee2 => 20})
    end
  end

  describe '#current_high_bid' do
    it 'shows high bid' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.current_high_bid).to eq(22)
    end
  end

  describe '#close_bidding' do
    it 'shows bidding that is closed' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item1.close_bidding
      expect(item1.close_bidding).to eq("bid closed")
      expect(item1.bids).to eq({attendee1 => 22, attendee2 => 20})
    end
  end
end
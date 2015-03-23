require 'rspec'
require_relative 'connect'


describe Connect do
  let(:connect) { described_class.new }


  it 'itemCountShouldBeCreated' do
    connect.drop_table
    connect.create_table
    connect.items

    expect(connect.item_count).to eq(3)

  end
end
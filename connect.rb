require "rubygems"
require "sequel"

class Connect

  # connect to an in-memory database
  #DB = Sequel.mysql2
  DB = Sequel.connect('mysql2://root@localhost/test')

  attr_accessor :items, :item_count

  def create_table

      DB.create_table :items do
        primary_key :id
        String :name
        Float :price
      end
  end

  def items
    items = DB[:items]


    items.insert(:name => 'abc', :price => rand * 100)
    items.insert(:name => 'def', :price => rand * 100)
    items.insert(:name => 'ghi', :price => rand * 100)

    @item_count = items.count
    puts "Item count: #{items.count}"
    puts "The average price is: #{items.avg(:price)}"
  end

  def drop_table
    DB.drop_table :items
  end

  end

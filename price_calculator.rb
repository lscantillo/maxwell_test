# frozen_string_literal: true

# $ ruby price_calculator.rb
# Please enter all the items purchased separated by a comma
# milk,milk, bread,banana,bread,bread,bread,milk,apple

# Item     Quantity      Price
# --------------------------------------
# Milk      3            $8.97
# Bread     4            $8.17
# Apple     1            $0.89
# Banana    1            $0.99

# Total price : $19.02
# You saved $3.45 today.

module GroceryItems
  ITEMS = {
    'apple' => {
      price: 0.89
    },
    'banana' => {
      price: 0.99
    },
    'bread' => {
      price: 2.17,
      sale: {
        quantity: 3,
        price: 6.00
      }
    },
    'milk' => {
      price: 3.97,
      sale: {
        quantity: 2,
        price: 5.00
      }
    }
  }.freeze
end

class GroceryShop

  def initialize(cart_items)
    @items = GroceryItems::ITEMS
    @shopping_cart = cart_items
  end

  def calculate_item_cost(item, quantity)
    item_info = @items[item]
    unit_price = item_info[:price]
    sale_quantity = item_info[:sale][:quantity] if item_info[:sale]
    sale_price = item_info[:sale][:price]   if item_info[:sale]

    if sale_quantity && sale_price
      sale_sets = quantity / sale_quantity
      remaining = quantity % sale_quantity
      total_price = (sale_sets * sale_price) + (remaining * unit_price)
      savings = (quantity * unit_price) - total_price
    else
      total_price = quantity * unit_price
      savings = 0.0
    end

    [total_price, savings]
  end

  def print
    total_cost = 0.0
    total_savings = 0.0

    puts 'Item     Quantity      Price'
    puts '--------------------------------------'

    @shopping_cart.each do |item, quantity|
      total_price, savings = calculate_item_cost(item, quantity)
      total_cost += total_price
      total_savings += savings

      puts "#{item.capitalize.ljust(9)} #{quantity.to_s.ljust(12)} $#{'%.2f' % total_price}"
    end

    puts "\nTotal price : $#{'%.2f' % total_cost}"
    puts "You saved $#{'%.2f' % total_savings} today."
  end

end

puts 'Please enter all the items purchased separated by a comma'
input = gets.chomp
items = input.split(',').map(&:strip).map(&:downcase).tally

cart = GroceryShop.new(items)
cart.print

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

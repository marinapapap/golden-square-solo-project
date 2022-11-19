class DishList
  def initialize
    @dish_list = []
  end

  def add(dish_with_price) # dish_with_price is an instance of Dish
    # Dish gets added to the menu
    # Returns nothing
    @dish_list << dish_with_price
  end

  def list
    # Returns list of dishes
    @dish_list
  end
  
  def selection
    # returns selected dishes
  end

  def receipt(selection)
  # takes selection and returns itemised receipt with grand total
  end
end

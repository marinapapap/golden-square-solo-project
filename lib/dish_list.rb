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

    @dish_list.select do |dish|
      dish.is_selected?
    end

  end

  def receipt
  # takes selection and returns itemised receipt with grand total
    selection.map do |item|
      item.format
    end
  end
end

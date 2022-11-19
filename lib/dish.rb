Dish = Struct.new(:dish, :price) do
  # def initialize(dish, price) # dish is a string and price is float
  #   @dish = dish
  #   @price = price
  # end

  # def dish # returns dish as string
  #   @dish
  # end

  # def price # returns price as float
  #   @price
  # end

  def format
    # Returns a string of the form "dish, £price"
  end

  def select
    # formats dish for selection
  end

  def deselect
    # reverse formatting, deselects dish
  end

  def is_selected?
    # returns true if dish has been selected
  end
end

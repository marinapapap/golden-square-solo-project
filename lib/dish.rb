Dish = Struct.new(:dish, :price) do
  def is_selected?
    # returns true if dish has been selected
    @selected == true
  end

  def format
    # Returns a string of the form "dish, £price"
    "#{dish}, £#{'%.2f' % price}"
  end

  def selected
    # formats dish for selection
    # "#{@dish}, £#{'%.2f' % @price}" + " -> selected"
    @selected = true
  end

  def deselect
    # reverse formatting, deselects dish
    # selected.gsub(" -> selected", "")
    @selected = false
  end
end

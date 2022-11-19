require 'dish'
require 'dish_list'

RSpec.describe "integration" do

  context "when dishes are added to the dish list" do
    it "returns full list" do
      dish_list = DishList.new
      dish_1 = Dish.new("pizza", 12.00)
      dish_2 = Dish.new("pasta", 12.00)
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      result = dish_list.list
      expect(result).to eq [dish_1, dish_2]
    end
  end

end
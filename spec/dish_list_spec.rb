require 'dish_list'

RSpec.describe DishList do

  context "initially" do
    it "returns empty list" do
      dish_list = DishList.new
      expect(dish_list.list).to eq []
    end
  end

  context "creates a double for dish" do
    it "returns fake list" do
      dish_list = DishList.new
      dish_1 = double :fake_dish
      dish_2 = double :fake_dish
      dish_list.add(dish_1)
      dish_list.add(dish_2)
      expect(dish_list.list).to eq [dish_1, dish_2]
    end
  end

end

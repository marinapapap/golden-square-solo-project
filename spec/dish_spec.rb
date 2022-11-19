require 'dish'

RSpec.describe Dish do

  context "constructs" do
    it "dish" do
      dish = Dish.new("pizza", 12.00)
      expect(dish.dish).to eq "pizza"
    end

    it "price" do
      dish = Dish.new("pizza", 12.00)
      expect(dish.price).to eq 12.00
    end
  end

end
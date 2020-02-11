require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    
    # subject {described_class.new(name: "Shoes", price: 3000, quantity: 25, category: "Shoes")}
    before do
      @category = Category.new(name: "New Stuff")
      @product = Product.new(name: "Blue Shoes", description:"blue blue", price_cents: 2500, quantity: 9, category: @category)
    end

    it "is valid when valid attributes" do 
      expect(@product).to be_valid
    end

    it "is valid when the product is present with a name" do 
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end
    it "is valid when the product is present with a price" do 
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "is valid when the product is present with a quantity" do 
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "is valid when the product is present with a category" do 
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end
  end
end

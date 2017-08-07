require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @product = Product.create name: 'String' ,price: 80 , quantity: 80
    @badproduct = Product.create
    @category = Category.create 
    @product.category = @category
  end

  describe 'Validations' do

    it 'should have a name' do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:name]).to include('can\'t be blank')
    end

    it 'should have a price' do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:price]).to include('can\'t be blank')
    end

    it 'should have a quantity' do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:quantity]).to include('can\'t be blank')
    end

    it 'should have a category' do
      expect(@product.category).to be_valid
      expect(@badproduct.errors.messages[:category]).to include('can\'t be blank')
    end
  end
end

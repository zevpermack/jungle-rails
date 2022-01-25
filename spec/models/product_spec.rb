require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "given all product fields correctly filled" do
      it 'should create a product with all four fields filled' do
        @product = Product.new()
        @category = Category.new()
        @product.name = "some product"
        @product.category = @category
        @product.quantity = 35
        @product.price = 223
        expect(@product.validate).to be true
      end
    end

    context "given product name as nil" do
      it 'should create a name can\'t be blank error' do
        @product = Product.new()
        @category = Category.new()
        @product.name = nil
        @product.category = @category
        @product.quantity = 35
        @product.price = 223
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end
    context "given product category as nil" do
      it 'should create a Cateogry can\'t be blank error' do
        @product = Product.new()
        @product.name = "some product"
        @product.category = nil
        @product.quantity = 35
        @product.price = 223
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end   
    context "given product quantity as nil" do
      it 'should create a Quantity can\'t be blank error' do
        @product = Product.new()
        @category = Category.new()
        @product.name = "some product"
        @product.category = @category
        @product.quantity = nil
        @product.price = 223
        @product.valid?
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end   
    context "given product price as nil" do
      it 'should create a Price can\'t be blank error' do
        @product = Product.new()
        @category = Category.new()
        @product.name = "some product"
        @product.category = @category
        @product.quantity = 55
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end   

  end
end

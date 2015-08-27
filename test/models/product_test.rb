require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product fields must not be empty" do
    product = Product.new
    product.save

    assert product.errors[:name].any?, "name must be present"
    assert product.errors[:description].any?, "description must be present"
    assert product.errors[:category_id].any?, "category must be present"
    assert product.errors[:brand_id].any?, "brand must be present"
    assert product.errors[:quantity].any?, "brand must be present"
    assert product.errors[:price].any?, "brand must be present"

    assert_not product.save, "saved product with empty attributes"
  end

  test "product name should be unique" do
    product = Product.new(price: 1, description: "my description", category_id: 1, brand_id: 1, quantity: 1)
    product.name = products(:one).name
    assert_not product.save, "saved product with non-unique name"
  end

  test "product price must be positive and greater than zero" do
    product = Product.new(name: "my product", description: "my description", category_id: 1, brand_id: 1, quantity: 1)

    product.price = 0
    assert product.invalid?, "invalid product"
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 1
    assert product.valid?, "product was invalid when given valid price"
  end

  test "product saves with all valid attributes" do
    product = Product.new(name: "my product", description: "my description", category_id: 1, brand_id: 1, quantity: 1, price: 1)
    assert product.save, "product wasn't saved when valid fields given"
  end

end

# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  category_id        :integer
#  brand_id           :integer
#  description        :text
#  price              :decimal(, )
#  quantity           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_products_on_brand_id     (brand_id)
#  index_products_on_category_id  (category_id)
#

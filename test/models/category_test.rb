require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category fields should not be empty" do
    category = Category.new
    assert_not category.save, "category saved with empty fields"
  end

  test "category name should be unique" do
    category = Category.new(name: categories(:one).name)
    assert_not category.save, "category saved with non-unique name"
  end

  test "category should save with valid fields" do
    category = Category.new(name: "unique_category")
    assert category.save, "category did't save when valid fields given"
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

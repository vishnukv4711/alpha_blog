require 'test_helper'
class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "category should be present" do
    @category.name = ""
    assert_not  @category.valid?
  end

  test "category should be unique" do
    @category.save
    @category_2 = Category.new(name:"Sports")
    assert_not @category_2.valid?
  end

  test "category should not be too long" do
    @category.name = "a"*21
    assert_not @category.valid?
  end

  test "category should not be short" do
    @category.name = "aa"
    assert_not @category.valid?
  end


end
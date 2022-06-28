require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category_1 = Category.create(name: "Sports")
    @category_2 = Category.create(name: "Nature")
  end


  test "the categories created must show up in index page and must have a show action link" do
    get categories_path
    assert_response :success
    # assert_match @category_1.name && @category_2.name , response.body    #this line only checks the text.
    assert_select 'a[href=?]', category_path(@category_1),text: @category_1.name         #this line checks for html element with href mentioned with text mentioned
    assert_select 'a[href=?]', category_path(@category_2),text: @category_2.name

  end
end

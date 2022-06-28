require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = User.create(username: "johndoe", email: "john@doe.com", password: "password", admin: true)
    sign_in_as(@admin_user)
  end


  test "get new category form then create the category and redirect to show" do
    get new_category_url
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_url, params: {category: {name:"Sports"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end


  test "get new category form and reject the invalid category submission" do
    get new_category_url
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_url, params: {category: {name:" "}}
    end
    assert_match "errors", response.body
    # assert_select 'div.xyz'             cz we don't have html code with classes
    # assert_select 'h4.abc'
  end



end

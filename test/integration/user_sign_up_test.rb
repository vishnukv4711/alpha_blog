require "test_helper"

class UserSignUpTest < ActionDispatch::IntegrationTest
  test "get the signup page and signup the user " do
    get signup_url
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {username:"johndoe", email:"john@doe.com", password:"password"}}
      assert_redirected_to articles_path
    end
  end
end

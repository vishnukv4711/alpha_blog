require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username:"johndoe", email:"john@doe.com", password:"password")
  end

  test 'new article page and create if signed in user' do
    sign_in_as(@user)
    assert_redirected_to articles_path
    get new_article_path
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article: {title:"sample", description:"sample description"}}
    end
    assert_redirected_to article_path(@user.articles.last.id)
  end
end

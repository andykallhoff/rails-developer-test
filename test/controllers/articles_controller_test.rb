require 'test_helper'
include TestPasswordHelper

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  #--- LOGGED IN AS AN ADMIN
  describe "when logged in as admin" do
    setup do
      @article = articles(:curious)
      @admin = users(:admin)
      sign_in @admin
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should get show" do
      get article_url(@article)
      assert_response :success
    end

    test "should get new" do
      get new_article_url
      assert_response :success
    end

    test "should create article" do
      post articles_url, params: { article: { title: 'TitleTest', category: 'curious', content: 'testing content', user_id: @admin.id } }
      assert_equal 'Article was successfully created.', flash[:notice]
      assert_redirected_to article_url(Article.first)
    end

    test "should render new if creating article has errors" do
      post articles_url, params: { article: { title: nil, category: 'curious', content: 'testing content', user_id: @admin.id } }
      assert_template :new
    end

    test "should get edit" do
      get edit_article_url(@article)
      assert_response :success
    end

    test "should update article" do
      patch article_url(@article), params: {article: { title: 'Updated Title' }}
      assert_equal 'Article was successfully updated.', flash[:notice]
      assert_redirected_to article_url(@article)
    end

    test "should render edit if updating article has errors" do
      patch article_url(@article), params: {article: { category: nil }}
      assert_template :edit
    end

    test "should delete article" do
      delete article_url(@article)
      assert_equal 'Article was deleted.', flash[:notice]
      assert_redirected_to articles_url
    end
  end

  #--- LOGGED IN AS AN EDITOR
  describe "when logged in as editor" do
    setup do
      @article = articles(:curious)
      @editor = users(:editor)
      sign_in @editor
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should get show" do
      get article_url(@article)
      assert_response :success
    end

    test "should get new" do
      get new_article_url
      assert_response :success
    end

    test "should create article" do
      post articles_url, params: { article: { title: 'TitleTest', category: 'curious', content: 'testing content', user_id: @editor.id } }
      assert_equal 'Article was successfully created.', flash[:notice]
      assert_redirected_to article_url(Article.first)
    end

    test "should get edit" do
      get edit_article_url(@article)
      assert_response :success
    end

    test "should update article" do
      patch article_url(@article), params: {article: { title: 'Updated Title' }}
      assert_equal 'Article was successfully updated.', flash[:notice]
      assert_redirected_to article_url(@article)
    end

    test "should delete article" do
      delete article_url(@article)
      assert_equal 'Article was deleted.', flash[:notice]
      assert_redirected_to articles_url
    end

    describe "if article's user is not this user" do
      test "should NOT get edit" do
        diff_article = articles(:funny)
        assert_raises(Pundit::NotAuthorizedError) do
          get edit_article_url(diff_article)
        end
      end

      test "should NOT update article" do
        diff_article = articles(:funny)
        assert_raises(Pundit::NotAuthorizedError) do
          patch article_url(diff_article), params: {article: { title: 'Updated Title' }}
        end
      end

      test "should NOT delete article" do
        diff_article = articles(:funny)
        assert_raises(Pundit::NotAuthorizedError) do
          delete article_url(diff_article)
        end
      end
    end
  end

  #--- LOGGED IN AS REGULAR USER
  describe "when logged in" do
    setup do
      @article = articles(:curious)
      @guest = users(:guest)
      sign_in @guest
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should get show" do
      get article_url(@article)
      assert_response :success
    end

    test "should NOT get new" do
      assert_raises(Pundit::NotAuthorizedError) do
        get new_article_url
      end
    end

    test "should NOT create article" do
      assert_raises(Pundit::NotAuthorizedError) do
        post articles_url, params: { article: { title: 'TitleTest', category: 'curious', content: 'testing content', user_id: @guest.id } }
      end
    end

    test "should NOT get edit" do
      diff_article = articles(:funny)
      assert_raises(Pundit::NotAuthorizedError) do
        get edit_article_url(diff_article)
      end
    end

    test "should NOT update article" do
      diff_article = articles(:funny)
      assert_raises(Pundit::NotAuthorizedError) do
        patch article_url(diff_article), params: {article: { title: 'Updated Title' }}
      end
    end

    test "should NOT delete article" do
      diff_article = articles(:funny)
      assert_raises(Pundit::NotAuthorizedError) do
        delete article_url(diff_article)
      end
    end
  end

  #--- NO LOG IN
  describe "when not logged in" do
    setup do
      @article = articles(:curious)
      @editor = users(:editor)
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    describe "should redirect to sign in page" do
      test "when attempting to get show" do
        get article_url(@article)
        assert_redirected_to new_user_session_url
      end

      test "when attempting to get new" do
        get new_article_url
        assert_redirected_to new_user_session_url
      end

      test "when attempting create article" do
        get new_article_url
        assert_redirected_to new_user_session_url
      end

      test "when attempting to get edit" do
        diff_article = articles(:funny)
        get edit_article_url(diff_article)
        assert_redirected_to new_user_session_url
      end

      test "when attempting to update article" do
        diff_article = articles(:funny)
        patch article_url(diff_article), params: {article: { title: 'Updated Title' }}
        assert_redirected_to new_user_session_url
      end

      test "when attempting to delete article" do
        diff_article = articles(:funny)
        delete article_url(diff_article)
        assert_redirected_to new_user_session_url
      end
    end
  end
end

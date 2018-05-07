require 'test_helper'
include TestPasswordHelper

class ArticleTest < ActiveSupport::TestCase
  test 'valid article' do
    article = articles(:curious)
    assert article.valid?
  end

  test 'invalid without title' do
    user = users(:editor)
    article = Article.new(user: user, category: 'funny', content: 'derp')
    refute article.valid?
    assert_not_nil article.errors[:title]
  end

  test 'invalid without content' do
    user = users(:editor)
    article = Article.new(user: user, title: 'title', category: 'funny')
    refute article.valid?
    assert_not_nil article.errors[:content]
  end

  test 'invalid without category' do
    user = users(:editor)
    article = Article.new(user: user, title: 'title', content: 'derp')
    refute article.valid?
    assert_not_nil article.errors[:category]
  end

  test 'invalid without user' do
    article = Article.new(title: 'title', category: 'funny', content: 'derp')
    refute article.valid?
    assert_not_nil article.errors[:user]
  end
end

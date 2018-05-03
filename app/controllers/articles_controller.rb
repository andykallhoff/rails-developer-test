class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize_article, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @articles = Article.all
    else
      @articles = Article::CATEGORIES.map{|c| Article.category(c).limit(3)}.flatten!
    end
  end

  def show
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = current_user.articles.new(article_params)
    authorize @article

    if @article.save
      redirect_to article_path(@article), notice: "Article was successfully created."
    else
      render action: :new, notice: "Oops, the article was not saved."
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article was successfully updated."
    else
      render action: :edit, notice: "Oops, the article was not saved."
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article was deleted."
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:user_id, :title, :content, :category)
    end

    def authorize_article
      authorize Article.find(params[:id])
    end
end

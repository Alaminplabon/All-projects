class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def edit
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  def update
    if @article.update(article_params)
      flash[:success] = "Article updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  def show
  end
  def destroy
    if @article.destroy
      flash[:success] = "Article deleted!"
    else
      flash[:error] = "Failed to delete article."
    end
    redirect_to articles_path
  end
  private
  def set_article
    @article = Article.find(params[:id])
  end
  private
  def article_params
    params.require(:article).permit(:title,:description)
  end
end
class ArticlesController < ApplicationController

  before_action :prepare_data


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :content)
  end

  def prepare_data
    @article = Article.find(params[:id]) if (params[:id] != nil)

  end

end

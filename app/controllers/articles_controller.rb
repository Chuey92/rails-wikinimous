class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully deleted.'
  end

  private

  # Set article before certain actions
  def set_article
    @article = Article.find(params[:id])
  end

  # Strong parameters to permit attributes
  def article_params
    params.require(:article).permit(:title, :content)
  end
end

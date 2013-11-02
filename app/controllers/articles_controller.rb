class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "a new article '#{@article.title}' has been created!"
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "article '#{@article.title}' updated!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "article '#{@article.title}' destroyed!"
    redirect_to article_path(@article)
  end

end

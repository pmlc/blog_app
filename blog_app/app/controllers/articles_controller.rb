class ArticlesController < ApplicationController
before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Your article was created succesfully!"
      redirect_to articles_path
    else
      flash[:danger] = "Article has not been created"
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to @article
    else
      flash.now[:danger] = "Article has NOT been updated"
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
    
  def article_params
    params.require(:article).permit(:title, :body)
  end
  
end

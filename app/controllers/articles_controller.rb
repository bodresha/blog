class ArticlesController < ApplicationController
  before_action :set_param, only: [:edit, :update, :show, :destroy]
  
  
  def index
    
    @articles = Article.paginate(page: params[:page], per_page: 4)
    @articles.order! 'created_at DESC'
    
    
  end
  
  
  
  
  def new
    
    @article = Article.new
    
  end
  
  def edit 
    

    
  end
  
  def create 
     
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Your article has been created"
      redirect_to article_path(@article)
    else
      render 'new'
    end

  end
  
  def update
    
    if @article.update(article_params)
      flash[:success] = "Your article has been updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    
  end
  
  def destroy
    
    @article.destroy
    flash[:danger] = "Article Deleted"
    redirect_to articles_path
    
  end
  
  private
  
  def set_param
    @article = Article.find(params[:id])
    
  end
  
  def article_params
    
    params.require(:article).permit(:title, :decsription)
    
  end
  
end

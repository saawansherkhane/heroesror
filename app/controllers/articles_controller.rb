class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def index
    @articles = Article.all
    render :json =>  @articles
  end


  def show
    @article = Article.find(params[:id])
    render :json =>  @article
  end

  def new
    @article = Article.new
    render :json =>  @article
  end

  def edit
    @article = Article.find(params[:id])
    render :json =>  @article
  end


  def create
    @article = Article.new(hero_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Hero was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(hero_params)
        format.html { redirect_to @article, notice: 'Hero was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:id, :title, :question, :answer)
  end
end

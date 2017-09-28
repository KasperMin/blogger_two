class ArticlesController < ApplicationController
	include ArticlesHelper
	
	
	def index
  	  @articles = Article.all
	end

	def show
	  @article = Article.find(params[:id])

	  @comment = Comment.new
	  @comment.article_id = @article.id
	end

	# New/create: display empty form -> process data manipulations

	def new
	  @article = Article.new
	end

	def create
 	   @article = Article.new(article_params)
 	   @article.save

       redirect_to article_path(@article)
	end

	# Destroy (fabricate delete verb): find article -> process data manipulations 

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy

	  redirect_to articles_path
	end

	# Edit/update: find and display form -> process data manipulations

	def edit
  	  @article = Article.find(params[:id])
	end

	def update
  	  @article = Article.find(params[:id])
 	  @article.update(article_params)

      flash.notice = "Article '#{@article.title}' Updated!"

   	  redirect_to article_path(@article)
	end
end

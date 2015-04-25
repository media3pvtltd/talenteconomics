class BlogController < ApplicationController
layout 'home'
  def index
    @articles = Refarticle.page(params[:page]).per(5)
    @photoids = []
    @articles.each {|e| @photoids << e.photo_id }
    @recent = Refarticle.order("created_at desc").limit(4)
  end
  def show
    @article = Refarticle.find(params[:id])
    @recent = Refarticle.order("created_at desc").limit(4)
  end
  
  #def create
   # @article = Article.new(:title => params[:article][:title], :content => params[:article][:content])
  	#if @article.save!
  	#	@image = Image.new
  	#	@image.file = params[:article][:file]
  	#	@image.article_id = @article.id
  	#	redirect_to articles_path if @image.save
  	#else
  	#	render :text => 'sorry something went wrong'
  	#end
  #end
end

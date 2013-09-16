class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    @category = Category.find(params[:category_id])
    @post = Post.create(params[:post])
    @category.posts << @post

    redirect_to category_post_path(@category, @post)
  end

  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end


  def update
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to category_post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    # respond_to do |format|
    #   format.html { redirect_to posts_url }
    #   format.json { head :no_content }
    # end
    redirect_to '/categories'
  end
end

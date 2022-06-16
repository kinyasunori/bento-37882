class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :new, :create, :show]
  before_action :set_post, only: [:edit, :show]

  def index
    @posts = Post.all.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path(@post)
    else
      render :new
      @post = Post.includes(:user)
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end


  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  

  

  private

  def move_to_index
    @post = Post.find(params[:id])
    unless user_signed_in? && current_user.id == @post.user_id
      redirect_to action: :index
    end
  end

  def post_params
    params.require(:post).permit(:title, :menu, :recipe, :image).merge(user_id: current_user.id)
  end 

  def set_post
    @post = Post.find(params[:id])
  end
end

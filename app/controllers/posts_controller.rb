class PostsController < ApplicationController
  PER_PAGE = 10
  before_action :authenticate_user!, only: [:show, :create]
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).page(params[:page]).order(created_at: :desc)
    @post = current_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_user.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to posts_path

    # @post = current_user.posts.new(post_params)
    # if @post.save
    #   redirect_back(fallback_location: posts_path)
    # else
    #   redirect_back(fallback_location: posts_path)
    # end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end


  def daycare
    @daycare = Post.where(category:"daycare")
  end

  def  healthcarefacility 
    @healthcarefacility = Post.where(category:"healthcarefacility")
  end

  def ward
    @ward = Post.where(category:"ward")
  end

  def outpatient
    @outpatient = Post.where(category:"outpatient")
  end



  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
   params.require(:post).permit(:title, :content, :start_time, :category, :image)
  end
end

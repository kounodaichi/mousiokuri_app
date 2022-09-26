class PostsController < ApplicationController
  PER_PAGE = 10
  before_action :authenticate_user!, only: [:show, :create]
  
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    @posts = current_user.posts.page(params[:page]).per(PER_PAGE) 
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
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
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


  #  def search
  #    @posts = @q.result
  #  end


  private
  # def set_q
  #   @q = Post.ransack(params[:q])
  # end
  def post_params
   params.require(:post).permit(:title, :content, :start_time, :category)
  end
end

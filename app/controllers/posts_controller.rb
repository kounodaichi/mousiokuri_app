# frozen_string_literal: true

class PostsController < ApplicationController
  protect_from_forgery
  PER_PAGE = 10
  before_action :authenticate_user!
  before_action :set_post, only: %i[edit update destroy]
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).page(params[:page]).order(created_at: :desc)
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
      redirect_to posts_path, notice: '投稿しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end

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
    if @post.update(post_params)
      redirect_to posts_path, notice: '更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path
  end

  def daycare
    @daycare = Post.where(category: 'デイケア')
  end

  def healthcarefacility
    @healthcarefacility = Post.where(category: '老健')
  end

  def ward
    @ward = Post.where(category: '病棟')
  end

  def outpatient
    @outpatient = Post.where(category: '外来')
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :start_time, :category, :image)
  end
end

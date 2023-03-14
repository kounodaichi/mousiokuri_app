# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  PER_PAGE = 20
  def index
    @today = Date.today # 今日の日付
    @tweet = Tweet.new
    @tweets = Tweet.where(done_at: nil).order(:time) # 未完了タスクかつ期限が近い順に並べ替え
    @tweets_done = Tweet.where.not(done_at: nil) # 完了タスク
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to action: 'index', notice: '投稿しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def done
    @today = Date.today # 今日の日付
    tweet = Tweet.find(params[:id])
    tweet.update(done_at: @today) # 完了ボタンを押すとdone_atカラムに完了した日時を追加
    redirect_to action: 'index'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:time, :title, :done_at)
  end
end

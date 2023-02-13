class TasksController < ApplicationController
  before_action :authenticate_user!
  PER_PAGE = 20
  def index
    @today = Date.today #今日の日付
    @task = Task.new
    @tasks = Task.where(done_at:nil).order(:time) #未完了タスクかつ期限が近い順に並べ替え
    @tasks_done = Task.where.not(done_at:nil) #完了タスク
  end

 def new
    @task = Task.new
 end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to :action => "index", notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

 
  def done
    
    @today = Date.today #今日の日付
    task = Task.find(params[:id])
    task.update(done_at: @today ) #完了ボタンを押すとdone_atカラムに完了した日時を追加
    redirect_to :action => "index"
  end

  private
  def task_params
    params.require(:task).permit(:time,:title,:done_at)
  end
end

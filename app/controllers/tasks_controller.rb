class TasksController < ApplicationController
  def index
    @today = Date.today #今日の日付
    @task = task.new
    @tasks = Task.where(done_at:nil).order(:time) #未完了タスクかつ期限が近い順に並べ替え
    @tasks_done = Task.where.not(done_at:nil) #完了タスク
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
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
    params.require(:task).permit(:time,:title,:done_at) #カラムの追加をお忘れなく
  end
end



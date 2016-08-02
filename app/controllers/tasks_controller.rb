class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.order(deadline: :asc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'タスクを登録しました。'
    else
      render :new
    end
  end

  def update
    @task.status = 2
    
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'タスクを編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました。'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :content, :deadline, :charge)
    end
end

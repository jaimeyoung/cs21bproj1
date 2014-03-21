class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @task = current_user.tasks.build
    @tasks = current_user.tasks.order('created_at DESC')
  end

  def all
    @tasks = Task.all
  end

  def completed
   @tasks=current_user.tasks.where(is_completed: true)
  end

  def incomplete
    @tasks = current_user.tasks.where(is_completed: false)
  end 

  def today 
    @tasks = current_user.tasks.where(due_date: Date.today)
  end 

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id #might cause error 

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

def search 
  @tasks = Task.where(tasks: params[:search])
end
def complete 
    if params[:task_checkbox] 
      params[:task_checkbox].each do |check| 
      task_id = check 
      t = Task.find_by_id(task_id)
      t.update_attribute(:completed,true)
      end 
    end
    redirect_to :action => 'all'
  end







  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      id = params[:task_id] ? params[:task_id] : params[:id]
      @task = Task.find_by_id(id)

      #@task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:tasks, :category, :due_date, :user_id)
    end

    def task_model
      Task.owner(current_user)
    end


end

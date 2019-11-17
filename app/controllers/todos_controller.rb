class TodosController < ApplicationController
  def index
    @todos = Todo.all # hold all todos in our database
  end

  def show
    @todo = Todo.find(params[:id]) # find the proper id for Todo
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create todo_params
    redirect_to todo_path(@todo) # we don't automatically load a new page after creation, this does
  end

  def todo_params
    params.require(:todo).permit(:title, :description) # ensure we have proper parameters on our func
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update todo_params

    redirect_to todos_path(@todo)

  end
end

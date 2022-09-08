class ItemsController < ApplicationController
  def index
    # @project = Project.find(params[:project_id])
    @items = Item.all
  end

  def show
    # @project = Project.find(params[:project_id])
    @item = Item.find(params[:id])
  end

  def new
    # @project = Project.find(params[:project_id])
    @item = Item.new
  end

  def create
    @project = Project.find(params[:project_id])
    @item = @project.items.create(item_params)
    redirect_to(@project)
  end

  def edit
    # @project = Project.find(params[:project_id])
    @item = Item.find(params[:id])
  end

  def update
    # @project = Project.find(params[:project_id])
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @project = Project.find(params[:project_id])
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def item_params
      params.require(:item).permit(:title, :body, :status)
    end
end

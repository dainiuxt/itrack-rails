class ItemsController < ApplicationController

  def index
    @items = Item.all
    @paged_items = Item.paginate(:page => params[:page], :per_page=>4)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @items = @project.items.build
  end

  def create
    @project = Project.find(params[:project_id])
    @item = @project.items.create(item_params)
    redirect_to project_path(@project)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @item = @project.items.find(params[:id])
    @item.destroy

    redirect_to project_path(@project), status: 303
  end

  private
    def item_params
      params.require(:item).permit(:title, :body, :status, :project_id)
    end

    def paged_item_params
      params.require(:item).permit(:title, :body, :status, :project_id, :page)
    end

end
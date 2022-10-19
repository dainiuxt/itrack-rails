class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @issues = Issue.all
  end

  def list
    @projects = Project.all
    @paged_projects = Project.paginate(:page => params[:page], :per_page=>2)
  end

  def show
    @project = Project.find(params[:id])
    @issue = @project.issues.build
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :status)
    end

    def paged_project_params
      params.require(:project).permit(:title, :description, :status, :page)
    end

end

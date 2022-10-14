class IssuesController < ApplicationController

  def index
    @issues = Issue.all
    @paged_issues = Issue.paginate(:page => params[:page], :per_page=>4)
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @issues = @project.issues.build
  end

  def create
    @project = Project.find(params[:project_id])
    @issue = @project.issues.create(issue_params)
    redirect_to project_path(@project)
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])

    if @issue.update(issue_params)
      redirect_to @issue
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @issue = @project.issues.find(params[:id])
    @issue.destroy

    redirect_to project_path(@project), status: 303
  end

  private
    def issue_params
      params.require(:issue).permit(:title, :body, :status, :project_id)
    end

    def paged_issue_params
      params.require(:issue).permit(:title, :body, :status, :project_id, :page)
    end

end
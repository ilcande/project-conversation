class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update]
  def index
    @projects = Project.all.includes(:comments)
  end

  def show; end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Status was successfully updated."
    else
      render :show
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:status)
  end
end

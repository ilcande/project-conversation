class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show update]

  def index
    @projects = Project.all.includes(:comments, :user)
  end

  def show; end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project was successfully created."
    else
      flash.now[:alert] = "There was an error with your submission."
      render :new, alert: "Project could not be created. Name is required."
    end
  end

  def update
    if @project.user == current_user && @project.update(project_params)
      redirect_to @project, notice: "Status was successfully updated."
    else
      redirect_to @project, alert: "You are not authorized to update the status."
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:status, :name)
  end
end

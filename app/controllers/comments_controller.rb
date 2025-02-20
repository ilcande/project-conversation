class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_comment, only: :destroy
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(
      comment_params.merge(user: current_user)
    )
    if @comment.save
      redirect_to @project, notice: "Comment was successfully added."
    else
      render "projects/show"
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      redirect_to @project, notice: "Comment was successfully deleted."
    else
      redirect_to @project, alert: "You can only delete your own comments."
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

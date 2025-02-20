class CommentsController < ApplicationController
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

  private

  def current_user
    User.find(params[:comment][:user_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

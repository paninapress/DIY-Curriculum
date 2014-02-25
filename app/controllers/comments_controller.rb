class CommentsController < ApplicationController
before_filter :authenticate_user!

def new
end

def create
  new_comment = params.require(:comment).permit(:text)
  course = Course.find(params[:course_id])
  course.comments.create(new_comment)

  redirect_to course_comments_path
end

end

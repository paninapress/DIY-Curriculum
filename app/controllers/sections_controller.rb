class SectionsController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show]

  def index
    course = Course.find(params[:course_id])
    @sections = course.sections
    # todo: pass json as :json => {"sections" => @sections}
    respond_to do |f|
      f.html
      f.json { render :json => @sections  }
    end
  end

  def show
    @section = Section.find(params[:id])
    course_params = params[:course_id]
    gon.content_path = "/courses/#{course_params}/sections/#{@section.id}/contents.json"
  end

  def new
    course = Course.find(params[:course_id])
    @sections = course.sections
    respond_to do |f|
      f.html
      f.json { render :json => @sections }
    end
  end

  def create
    new_section = params.require(:section).permit(:title)
    @section = Section.create(new_section)
    course = Course.find(params[:course_id])
    @section.course_id = course.id
    @section.save
    respond_to do |f|
      f.json { render :json => @section }
    end
    # redirect_to course_sections_path(course)
  end

  def edit
  end

  def update
  end

  def delete
  end


end

class ProjectsController < ApplicationController
  def new
    @a_new_project = Project.new 
    @a_new_project.save
    redirect_to @a_new_project  
  end

  def show
    @project = Project.find_by_secret(params[:secret]) 
    if @project.nil?
      redirect_to root_path
    end
  end

end

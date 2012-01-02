class ProjectsController < ApplicationController
  def new
    a_new_project = Project.new 
    a_new_project.save
    #TODO: is there a method for this new URL? like new_project_path after scaffolding
    new_url = root_path + a_new_project.secret 
    redirect_to new_url 
  end

  def show
    @project = Project.find_by_secret(params[:secret]) 
    if @project.nil?
      redirect_to root_path
    end
  end

end

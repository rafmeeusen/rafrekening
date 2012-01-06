class ProjectsController < ApplicationController
  def new
  end

  def create
    a_new_project = Project.create(:title=>params[:title])
    #TODO: is there a method for this new URL? like new_project_path after scaffolding
    new_url = root_path + a_new_project.secret
    redirect_to new_url
  end

  def show
    @project = Project.find_by_secret(params[:secret]) 
    #TODO: page 'non-existing URL'if project ? guess yes... 
    if @project.nil?
      redirect_to root_path
    else
      @titletemp=@project.secret
    end
  end

end

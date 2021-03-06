class PeopleController < ApplicationController
  include ProjectsHelper
  def new
    @project = Project.find_by_secret(params[:secret])
    @person = Person.new    
  end
  def show
    @project = Project.find_by_secret(params[:secret])
    @person = @project.people.find_by_name(params[:name])
    if @person.nil?
      redirect_to project_path 
    end
  end
  def create
    @project = Project.find_by_secret(params[:secret])
    pid = @project.id 
    pers= params[:person]
    @person = Person.new(:project_id=>pid,:name=>pers[:name],:pweight=>pers[:pweight])
    @person.save
    redirect_to project_path 
  end
  def edit
    @person = Person.find_by_name(params[:name])
    if @person.nil?
      redirect_to project_path 
    end
  end
  def destroy
    person = Project.find_by_secret(params[:secret]).people.find_by_name(params[:name])
    person.destroy 
    redirect_to project_path
  end
  def update
    #warning: name could be updated now
    person = Project.find_by_secret(params[:secret]).people.find_by_name(params[:name])
    person.update_attributes(params[:person])
    redirect_to project_path 
  end
end

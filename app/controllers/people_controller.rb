class PeopleController < ApplicationController

  def new
    @project = Project.find_by_secret(params[:secret])
    @person = Person.new    
  end

  def show
    @project = Project.find_by_secret(params[:secret])
    @person = @project.people.find_by_name(params[:name])
    if @person.nil?
      redirect_to root_path + params[:secret]
    end
  end

  def create
    @project = Project.find_by_secret(params[:secret])
    pid = @project.id 
    pers= params[:person]
    name= pers[:name]
    @person = Person.new(:project_id=>pid,:name=>name)
    @person.save
    redirect_to root_path + params[:secret]
  end
  
  def edit
    @person = Person.find_by_name(params[:name])
    if @person.nil?
      redirect_to root_path + params[:secret]
    end
  end

end

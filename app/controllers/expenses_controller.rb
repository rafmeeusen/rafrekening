class ExpensesController < ApplicationController
  include PeopleHelper
  def new
    @project = Project.find_by_secret(params[:secret])
    @person = @project.people.find_by_name(params[:name]) 
    @expense = Expense.new
  end

  def create
    @project = Project.find_by_secret(params[:secret])
    projectPeople = @project.people
      
    person = projectPeople.find_by_name(params[:name]) 
    persid = person.id
    exp = params[:expense]
    amount=exp[:amount]
    descr=exp[:description]
    @expense = Expense.new(:person_id=>persid, :amount=>amount, :description=>descr) 
    @expense.save
    redirect_to person_path(params[:name]) 
  end
  
  def destroy
    expense=Expense.find(params[:id])
    expense.destroy
    name=expense.person.name
    redirect_to person_path(name)
  end
end
